module DAP::Relation
  def self.supported!(klazz)
    raise "Unsupported property class #{klazz}" unless klazz < DAP::Base || klazz < DAP::Enum
  end

  class Many
    attr_reader :klazz

    def initialize(klazz)
      DAP::Relation.supported!(klazz)
      @klazz = klazz
    end
  end

  class OneOf
    attr_reader :types, :key

    def initialize(types)
      types.values.each { |k| DAP::Relation.supported!(k) }
      @types = types
    end

    def with(key)
      @key = key
      self
    end
  end
end
