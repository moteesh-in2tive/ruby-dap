# Base class for DAP enumerations
class DAP::Enum
  # Retreive an enumeration instance by value.
  # @param value [String] the enumeration string value
  # @return [Enum] the enumeration instance
  def self.from(value)
    values[value]
  end

  # The enumeration string value
  def to_s
    @value
  end

  # The enumeration string value, suitable for encoding
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
