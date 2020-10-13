# Relationships between DAP types
module DAP::Relation
  # Raises an error if `klazz` is not an allowed DAP type
  def self.supported!(klazz)
    raise "Unsupported property class #{klazz}" unless klazz < DAP::Base || klazz < DAP::Enum
  end

  # Indicates a property is expected to be an array of the specified type
  class Many
    # The expected element type.
    attr_reader :klazz

    # @param klazz [Class] the expected element type
    def initialize(klazz)
      DAP::Relation.supported!(klazz)
      @klazz = klazz
    end
  end

  # Indicates a property is expected to be one of a set of types
  class OneOf
    # The allowed key property values and expected types.
    attr_reader :types

    # The name of the key property.
    attr_reader :key

    # @param types [Hash<Symbol, Class>] the allowed key property values and expected types
    def initialize(types)
      types.values.each { |k| DAP::Relation.supported!(k) }
      @types = types
    end

    # Specifies the key property that is used to determine which type is selected.
    # @param key [Symbol] the name of the key property
    def with(key)
      o = dup
      o.instance_eval { @key = key }
      o
    end

    # Sets the expected type for a specified value of the key property.
    # @param k [Symbol] the specified value
    # @param v [Class] the expected type
    def []=(k, v)
      @types[k] = v
    end
  end
end
