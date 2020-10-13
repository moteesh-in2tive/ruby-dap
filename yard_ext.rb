class PropertyHandler < YARD::Handlers::Ruby::Base
  handles method_call(:property)
  namespace_only

  def process
    return if statement.type == :var_ref || statement.type == :vcall
    return if statement.method_name(true) != :property

    properties = []
    required = true
    as = nil

    statement.parameters(false).each do |obj|
      case obj.type
      when :symbol_literal
        properties << obj.jump(:ident, :op, :kw, :const).source
      when :list
        obj.each do |obj|
          undocumentable!(obj) unless obj.type == :assoc && obj[0].type == :label

          case obj[0].source
          when 'required:'
            required = false if obj[1].jump(:kw)&.source == 'false'
          when 'as:'
            as = obj[1]
          else
            undocumentable!(obj)
          end
        end
      else
        undocumentable!(obj)
      end
    end

    properties.each do |property|
      namespace.attributes[scope][property] ||= SymbolHash[:read => nil, :write => nil]

      o = MethodObject.new(namespace, property, scope)
      o.source ||= "def #{property}\n  @#{property}end"
      o.signature ||= "def #{property}"
      o.docstring = statement.docstring&.gsub('{', '&#123;')
      o.add_tag(YARD::Tags::Tag.new(:optional, 'Optional')) unless required
      o.add_tag(YARD::Tags::Tag.new(:return, "the #{property} attribute", as_type(as)))

      namespace.attributes[scope][property][:read] = o
    end
  end

  private

  def undocumentable!(obj)
    raise YARD::Parser::UndocumentableError, obj.source
  end

  def as_type(as)
    return unless as

    case as.type
    when :string_literal
      t = as.jump(:string_content).source
      case t
      when 'string'
        'String'
      when 'number'
        'Number'
      when 'boolean'
        'Boolean'
      else
        t
      end

    when :const_path_ref
      as.source

    when :fcall
      return unless as[0].type == :ident

      case as[0].source
      when 'many'
        return unless as[1].type == :arg_paren

        t = as_type(as[1][0][0])
        "#{t}[]" if t
      end
    end
  end
end
