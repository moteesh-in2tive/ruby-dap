# Usage:
# cat interface.js | ruby convert.rb > lib/dap/interface.rb

PRETEND = true

# PRINT_SKIP = true
# PRINT_NO_CONTENT = true
# PRINT_EXTENDS = true
# PRINT_REQUIRED = true
# REQUESTS_ONLY = true
# EVENTS_ONLY = true
# RESPONSES_ONLY = true

def main
  # convert($stdin.read)

  IO.read('dap-spec.ts').split("\n\n// ---\n\n").each { |s| convert(s) }
end

def iface2file(iface)
  iface.gsub(/(^|[a-z])([A-Z])/) { |m| m.size == 1 ? m.downcase : m[0] + '_' + m[1].downcase }
end

def convert(js)
  if defined?(REQUESTS_ONLY)
    if m = js.match(/interface \w+Request extends Request {\n  command: '(?<command>\w+)';(?:\n\n  arguments\??: (?<arguments>\w+);|.*)\n}/m)
      puts "Request #{m[:command]} => #{m[:arguments] || 'none'}"
    end
    return
  end

  if defined?(EVENTS_ONLY)
    if m = js.match(/interface (?<interface>\w+)Event extends Event {\n  event: '(?<event>\w+)';(?:\n\n  body\??: {\n(?<body>.*)\n  };\n|.*)}/m)
      puts "Event #{m[:event]} => #{m[:body] ? m[:interface] + 'EventBody' : 'none'}"
    end
    return
  end

  if defined?(RESPONSES_ONLY)
    if m = js.match(/interface (?<interface>\w+)Response extends Response {(\n  body\??: {\n(?<body>.*)\n  };|.*)\n}/m)
      puts "Response #{m[:interface][0].downcase}#{m[:interface][1..]} => #{m[:body] ? m[:interface] + 'ResponseBody' : 'none'}"
    end
    return
  end

  if m = js.match(/interface (?<interface>\w+)Event extends Event {\n  event: '\w+';\n\n  body\??: {\n(?<body>.*)\n  };\n}/m)
    iface = m[:interface] + 'EventBody'
    extends = 'Base'
    body = m[:body].split("\n").map { |l| l[2..] }.join("\n")

  elsif m = js.match(/interface (?<interface>\w+)Response extends Response {\n  body\??: {\n(?<body>.*)\n  };\n}/m)
    iface = m[:interface] + 'ResponseBody'
    extends = 'Base'
    body = m[:body].split("\n").map { |l| l[2..] }.join("\n")

  elsif m = js.match(/interface (?<interface>\w+)(?: extends (?<extends>\w+))? {\n(?<body>.*)\n?}/m)
    iface = m[:interface]
    extends = m[:extends] || 'Base'
    body = m[:body]

    if /.+(Event|Request|Response)$/ =~ iface
      puts "Skipping #{iface}" if defined?(PRINT_SKIP)
      return
    end

  elsif m = js.match(/type (\w+) = ((?:'\w+' \| )*'\w+');/)
    iface = m[1]
    enums = m[2].split(' | ')

    file = open_iface_file(iface)
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
    puts "No content for #{iface}" if defined?(PRINT_NO_CONTENT)
    return
  end

  required = []
  required << iface2file(extends) if extends != 'Base'

  vars.each do |comment, name, optional, type|
    next if /^[a-z]/ =~ type
    next unless m = type.match(/^(\w+)(\[\])?$/)
    next if m[1] == 'InvalidatedAreas'

    required << iface2file(m[1])
  end

  puts "#{iface} extends #{extends}" if extends != 'Base' && defined?(PRINT_EXTENDS)
  puts "#{iface} needs #{required.join(', ')}" unless required.empty? || !defined?(PRINT_REQUIRED)

  return if /^(ProtocolMessage|Request|Event|Response)$/ =~ iface

  file = open_iface_file(iface)

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
    file.write ", required: false" if optional == '?'
    unless /^[a-z]/ =~ type
      if (m = type.match(/^(\w+)$/)) && m[1] != 'InvalidatedAreas'
        file.write ", as: DAP::#{type}"
      elsif (m = type.match(/^(\w+)\[\]$/)) && m[1] != 'InvalidatedAreas'
        file.write ", as: many(DAP::#{type[0...-2]})"
      else
        file.write " # #{type}"
      end
    end
    file.puts
  end
  file.puts "end"
end

def open_iface_file(iface)
  if defined?(PRETEND)
    puts
    puts "# --- #{iface} => #{iface2file(iface)}.rb ---"
    $stdout
  else
    File.open("lib/dap/#{iface2file(iface)}.rb", 'w')
  end
end

main
