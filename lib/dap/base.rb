# Base class for DAP types
class DAP::Base
  # Build an instance of a DAP type.
  # @param values [Hash|String] attribute values or enum string
  # @yieldparam values [Hash] normalized attribute values (optional)
  # @yieldreturn [Class] the class to instantiate
  def self.build(values, &block)
    values.transform_keys! &:to_sym if values.is_a? Hash

    if block.arity == 0
      klazz = yield
    else
      klazz = yield(values)
    end

    return values if values.is_a? klazz

    return klazz.from(values) if klazz < DAP::Enum

    klazz.new(values)
  end

  # Returns a relation that indicates a property should be an array of the
  # specified type.
  # @param klazz [Class] the expected type of members of the property
  # @return [Relation::Many]
  def self.many(klazz)
    DAP::Relation::Many.new(klazz)
  end

  # Returns a relation that indicates a property should be one of a set of
  # types.
  # @param choices [Hash[String, Class]] the allowed property types
  # @return [Relation::OneOf]
  def self.one_of(choices)
    DAP::Relation::OneOf.new(choices)
  end

  # Returns a relation that indicates a property is expected to be an empty
  # object.
  def self.empty
    Class.new(DAP::Base)
  end

  # Defines a property or properties.
  # @param names [Array<Symbol>] the properties
  # @param as [Class|Relation|String] the expected type of the property
  # @param required [Boolean] whether the property is required
  def self.property(*names, as: nil, required: true)
    @properties ||= []
    @transformations ||= {}

    klazz = name

    names.each do |name|
      case as
      when nil, String
        # ignore

      when Class
        DAP::Relation.supported!(as)

        transform = ->(value, values, invert: false) { value.nil? ? nil : invert ? value.to_wire : build(value || {}) { as } }

      when DAP::Relation::Many
        transform = ->(value, values, invert: false) { value.nil? ? nil : invert ? value.map(&:to_wire) : value.map { |v| build(v) { as.klazz } } }

      when DAP::Relation::OneOf
        transform = ->(value, values, invert: false) do
          return value.to_wire if invert

          build(value || {}) do
            key = values[as.key]&.to_sym
            raise "#{klazz}.#{as.key} missing" if key.nil?
            raise "Unknown #{klazz}.#{as.key}: '#{key}'" unless as.types.key?(key)

            as.types[key]
          end
        end

      else
        raise "Invalid property constraint: #{as.class} #{as.inspect}"
      end

      @properties << {
        name: name,
        transform: transform,
        required: required
      }
    end


    attr_reader(*names)
  end

  # Properties of the receiver.
  def self.properties
    @properties ||= []
    return @properties if self == DAP::Base

    superclass.properties + @properties
  end

  # Names of the receiver's properties.
  def self.property_names
    properties.map { |p| p[:name] }
  end

  # Retreives the transform for the named property.
  # @param name [String] the property name
  # @return [Proc] the transform
  def self.transform(name)
    (@properties || []).each { |p| return p[:transform] if p[:name] == name && p[:transform] }

    return superclass.transform(name) unless self == DAP::Base
  end

  # Create a new instance of the receiver.
  # @param values [Hash] the object's attributes
  def initialize(values)
    values.transform_keys!(&:to_sym)

    self.class.property_names.each do |k|
      v = values[k]

      transform = self.class.transform(k)
      v = transform.call(v, values) if transform

      self[k] = v
    end
  end

  # Validate property values against their expectations.
  def validate!
    self.class.properties.each do |p|
      key, required = p[:name], p[:required]
      value = self[key]
      if value.nil?
        raise "Property #{key} of #{self.class} is required" if required
        next
      end

      if value.respond_to?(:validate!)
        value.validate!
      elsif value.respond_to?(:each)
        value.each { |v| v.validate! if v.respond_to?(:validate!) }
      end
    end

    self
  end

  # Convert the receiver to a form suitable for encoding.
  # @return [Hash]
  def to_wire
    self.class.property_names.each_with_object({}) do |k, h|
      v = self[k]
      next if v.nil?

      if transform = self.class.transform(k)
        v = transform.call(v, self, invert: true) if transform
      else
        v = convert_complex(v)
      end

      h[k] = v
    end
  end

  def [](key)
    key = key.to_sym
    instance_variable_get("@#{key}".to_sym) if self.class.property_names.include? key
  end

  private

  def []=(key, value)
    key = key.to_sym
    instance_variable_set("@#{key}".to_sym, value)
  end

  def convert_complex(v)
    case v
    when Array
      v.map { |v| convert_complex(v) }
    when Hash
      v.transform_values { |v| convert_complex(v) }
    when DAP::Base, DAP::Enum
      v.to_wire
    when String
      v.encode('UTF-8', invalid: :replace, undef: :replace, replace: '?')
    else
      v
    end
  end
end
