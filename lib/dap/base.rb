class DAP::Base
  def self.from(values, &block)
    values.transform_keys! &:to_sym if values.is_a? Hash

    if block.arity == 0
      klazz = yield
    else
      klazz = yield(values)
    end

    raise "Unknown #{name} type '#{selector}'" unless klazz
    return values if values.is_a? klazz

    klazz.new(values)
  end

  def self.property(*names)
    @properties ||= []

    @properties.push(*names)
    attr_reader(*names)
  end

  def self.transform(name, to:, with: nil)
    @transformations ||= {}

    if with.nil?
      @transformations[name] = ->(value, values) { from(value || {}) { to } }
    else
      @transformations[name] = ->(value, values) { from(value || {}) { to[values[with].to_sym] } }
    end
  end

  def self.transform_array(name, to:, with: nil)
    @transformations ||= {}

    if with.nil?
      @transformations[name] = ->(value, values) { (value || []).map { |v| from(v) { to } } }
    else
      @transformations[name] = ->(value, values) { (value || []).map { |v| from(v) { to[values[with].to_sym] } } }
    end
  end

  def self.properties
    @properties ||= []
    return @properties if self == Base

    superclass.properties + @properties
  end

  def self.transformations(name)
    @transformations ||= {}
    return @transformations[name] if self == Base

    @transformations[name] || superclass.transformations(name)
  end

  def initialize(values)
    values.transform_keys!(&:to_sym)

    self.class.properties.each do |k|
      v = values[k]

      transform = self.class.transformations(k)
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
