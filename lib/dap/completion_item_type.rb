# Some predefined types for the CompletionItem. Please note that not all clients
# have specific icons for all of them.
class DAP::CompletionItemType < DAP::Enum
  METHOD = new('method')
  FUNCTION = new('function')
  CONSTRUCTOR = new('constructor')
  FIELD = new('field')
  VARIABLE = new('variable')
  CLASS = new('class')
  INTERFACE = new('interface')
  MODULE = new('module')
  PROPERTY = new('property')
  UNIT = new('unit')
  VALUE = new('value')
  ENUM = new('enum')
  KEYWORD = new('keyword')
  SNIPPET = new('snippet')
  TEXT = new('text')
  COLOR = new('color')
  FILE = new('file')
  REFERENCE = new('reference')
  CUSTOMCOLOR = new('customcolor')
end
