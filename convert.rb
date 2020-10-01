# Usage:
# cat interface.js | ruby convert.rb > lib/dap/interface.rb

PRINT_SKIP = false
PRINT_NO_CONTENT = false
PRINT_EXTENDS = false
PRINT_REQUIRED = false

def main
  # convert($stdin.read)

  IO.read('dap-spec.ts').split("\n\n// ---\n\n").each { |s| convert(s) }
end

def iface2file(iface)
  iface.gsub(/(^|[a-z])([A-Z])/) { |m| m.size == 1 ? m.downcase : m[0] + '_' + m[1].downcase }
end

def convert(js)
  if m = js.match(/interface (?<interface>\w+)(?: extends (?<extends>\w+))? {\n  body\??: {\n(?<body>.*)\n  };\n}/m)
    iface = m[:interface] + 'Body'
    extends = 'Base'
    body = m[:body].split("\n").map { |l| l[2..] }.join("\n")

  elsif m = js.match(/interface (?<interface>\w+)(?: extends (?<extends>\w+))? {\n(?<body>.*)\n?}/m)
    iface = m[:interface]
    extends = m[:extends] || 'Base'
    body = m[:body]

    if /.+(Event|Request|Response)$/ =~ iface
      puts "Skipping #{iface}" if PRINT_SKIP
      return
    end

  elsif m = js.match(/type (\w+) = ((?:'\w+' \| )*'\w+');/)
    iface = m[1]
    enums = m[2].split(' | ')

    file = File.open("lib/dap/#{iface2file(iface)}.rb", 'w')
    first = true
    file.puts "class DAP::#{iface} < DAP::Enum"
    enums.each { |e| file.puts "  #{e[1...-1].upcase} = new(#{e})" }
    file.puts "end"
    return

  else
    puts "Bad input: #{js}"
    return
  end

  vars = body.scan(/  \/\*\*\n((?:   \* .*\n)*)   \*\/\n. (\w+)(\??): (.*);/)

  unless vars && vars.size > 0
    puts "No content for #{iface}" if PRINT_NO_CONTENT
    return
  end


  required = []
  required << iface2file(extends) if extends != 'Base'

  vars.each do |comment, name, optional, type|
    next if /^[a-z]/ =~ type
    next unless m = type.match(/^(\w+)(\[\])?$/)

    required << iface2file(m[1])
  end

  puts "#{iface} extends #{extends}" if extends != 'Base' && PRINT_EXTENDS
  puts "#{iface} needs #{required.join(', ')}" unless required.empty? || !PRINT_REQUIRED

  return if /^(ProtocolMessage|Request|Event|Response)$/ =~ iface

  file = File.open("lib/dap/#{iface2file(iface)}.rb", 'w')

  unless required.empty?
    required.each { |r| file.puts "require_relative '#{r}'" }
    file.puts
  end

  file.puts "class DAP::#{iface} < DAP::#{extends}"

  first = true
  vars.each do |comment, name, optional, type|
    if first
      first = false
    else
      file.puts
    end

    comment.scan(/   \* (.*)\n/).map { |c| file.puts "  # #{c[0]}" }
    file.write "  property :#{name}"
    unless /^[a-z]/ =~ type
      if m = type.match(/^\w+$/)
        file.write ", as: DAP::#{type}"
      elsif m = type.match(/^\w+\[\]$/)
        file.write ", as: many(DAP::#{type[0...-2]})"
      else
        file.write " # #{type}"
      end
    end
    file.puts
  end
  file.puts "end"
end

main
