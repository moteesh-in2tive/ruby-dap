class DAP::Enum
  def to_s
    @value
  end

  private

  def initialize(value)
    @value = value
    self.class.values[value] = self
  end

  def self.values
    @values ||= {}
  end
end
