module DAP::Relation
  class Many
    attr_reader :klazz

    def initialize(klazz)
      @klazz = klazz
    end
  end

  class OneOf
    attr_reader :types, :with

    def initialize(types)
      @types = types
    end

    def with(with)
      @with = with
    end
  end
end
