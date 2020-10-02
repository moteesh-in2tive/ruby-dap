class DAP::Enum
  def self.from(value)
    values[value]
  end

  def to_s
    @value
  end

  def to_wire
    @value
  end

  private

  def self.new(value)
    super
  end

  def initialize(value)
    @value = value
    self.class.values[value] = self
  end

  def self.values
    @values ||= {}
  end
end
