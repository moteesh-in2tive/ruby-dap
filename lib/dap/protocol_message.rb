module DAP
  class ProtocolMessage
    def self.types
      @types ||= DAP.constants
        .map { |c| DAP.const_get c }
        .filter { |c| c.is_a?(Class) && c < self }
        .map { |c| [c.type, c] }
        .to_h
    end

    def self.from(values)
      raise "Message type is missing" unless values['type']

      klazz = types[values['type']]
      raise "Unknown message type '#{values['type']}'" unless klazz

      klazz.new(values)
    end

    def self.properties
      @properties ||= []

      if self == ProtocolMessage
        @properties
      else
        superclass.properties + @properties
      end
    end

    def self.property(*names)
      @properties ||= []

      @properties.push(*names)
      attr_reader(*names)
    end

    property :seq, :type

    def initialize(values)
      @seq = self.class.seq
      @type = self.class.type

      values.transform_keys(&:to_sym).each do |k, v|
        instance_variable_set("@#{k}".to_sym, v) if self.class.properties.include? k
      end
    end

    def to_h
      self.class.properties.each_with_object({}) do |k, h|
        h[k] = instance_variable_get("@#{k}".to_sym)
      end
    end

    private

    def self.seq
      @seq ||= 0
      @seq += 1
    end
  end
end
