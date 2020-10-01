class DAP::Base
  def self.from(values, &block)
    values.transform_keys! &:to_sym if values.is_a? Hash

    if block.arity == 0
      klazz = yield
    else
      klazz = yield(values)
    end

    return values if values.is_a? klazz

    klazz.new(values)
  end

  def self.many(klazz)
    DAP::Relation::Many.new(klazz)
  end

  def self.one_of(choices)
    DAP::Relation::OneOf.new(choices)
  end

  def self.property(*names, as: nil)
    @properties ||= []
    @transformations ||= {}

    klazz = name

    if as.is_a? Class
      names.each do |name|
        @transformations[name] = ->(value, values) { from(value || {}) { as } }
      end

    elsif as.is_a? DAP::Relation::Many
      names.each do |name|
        @transformations[name] = ->(value, values) { (value || []).map { |v| from(v) { as.klazz } } }
      end

    elsif as.is_a? DAP::Relation::OneOf
      names.each do |name|
        @transformations[name] = ->(value, values) do
          from(value || {}) do
            key = values[as.with]&.to_sym
            raise "#{klazz}.#{as.with} missing" if key.nil?
            raise "Unknown #{klazz}.#{as.with}: '#{key}'" unless as.types.key?(key)

            as.types[key]
          end
        end
      end
    end

    @properties.push(*names)
    attr_reader(*names)
  end

  def self.properties
    @properties ||= []
    return @properties if self == DAP::Base

    superclass.properties + @properties
  end

  def self.transform(name)
    @transformations ||= {}
    return @transformations[name] if self == DAP::Base

    @transformations[name] || superclass.transform(name)
  end

  def initialize(values)
    values.transform_keys!(&:to_sym)

    self.class.properties.each do |k|
      v = values[k]

      transform = self.class.transform(k)
      v = transform.call(v, values) if transform

      self[k] = v
    end
  end

  def to_h
    self.class.properties.each_with_object({}) do |k, h|
      h[k] = self[k]
    end
  end

  def [](key)
    key = key.to_sym
    instance_variable_get("@#{key}".to_sym) if self.class.properties.include? key
  end

  private

  def []=(key, value)
    key = key.to_sym
    instance_variable_set("@#{key}".to_sym, value)
  end
end
