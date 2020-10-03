class DAP::Base
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

  def self.many(klazz)
    DAP::Relation::Many.new(klazz)
  end

  def self.one_of(choices)
    DAP::Relation::OneOf.new(choices)
  end

  def self.empty
    Class.new(DAP::Base)
  end

  def self.property(*names, as: nil, required: true)
    @properties ||= []
    @transformations ||= {}

    klazz = name

    names.each do |name|
      if as.is_a?(Class)
        DAP::Relation.supported!(as)

        transform = ->(value, values, invert: false) { value.nil? ? nil : invert ? value.to_wire : build(value || {}) { as } }

      elsif as.is_a? DAP::Relation::Many
        transform = ->(value, values, invert: false) { value.nil? ? nil : invert ? value.map(&:to_wire) : value.map { |v| build(v) { as.klazz } } }

      elsif as.is_a? DAP::Relation::OneOf
        transform = ->(value, values, invert: false) do
          return value.to_wire if invert

          build(value || {}) do
            key = values[as.key]&.to_sym
            raise "#{klazz}.#{as.key} missing" if key.nil?
            raise "Unknown #{klazz}.#{as.key}: '#{key}'" unless as.types.key?(key)

            as.types[key]
          end
        end

      elsif !as.nil?
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

  def self.properties
    @properties ||= []
    return @properties if self == DAP::Base

    superclass.properties + @properties
  end

  def self.property_names
    properties.map { |p| p[:name] }
  end

  def self.transform(name)
    (@properties || []).each { |p| return p[:transform] if p[:name] == name && p[:transform] }

    return superclass.transform(name) unless self == DAP::Base
  end

  def initialize(values)
    values.transform_keys!(&:to_sym)

    self.class.property_names.each do |k|
      v = values[k]

      transform = self.class.transform(k)
      v = transform.call(v, values) if transform

      self[k] = v
    end
  end

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

  def to_wire
    self.class.property_names.each_with_object({}) do |k, h|
      v = self[k]
      next if v.nil?

      transform = self.class.transform(k)
      v = transform.call(v, self, invert: true) if transform

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
end
