PRETEND = true

# PRINT_SKIP = true
# PRINT_NO_CONTENT = true
# PRINT_EXTENDS = true
# PRINT_REQUIRED = true
# REQUESTS_ONLY = true
# EVENTS_ONLY = true
# RESPONSES_ONLY = true

def main
  unless file = ARGV.pop
    STDERR.puts "Usage: ./convert.rb [-|<file>]"
    exit
  end

  if file == '-'
    s = STDIN.read
  else
    s = IO.read(file)
  end

  s.split("\n\n// ---\n\n").each { |s| convert(s) }
end

def iface2file(iface)
  iface.gsub(/(^|[a-z])([A-Z])/) { |m| m.size == 1 ? m.downcase : m[0] + '_' + m[1].downcase }
end

def wrap(s, n)
  r = []
  s = s.split(' ')

  l = ''
  until s.empty?
    if l.empty?
      l = s.shift
      next
    end

    w = s.shift
    if l.size + w.size + 1 > n
      r << l
      l = w
    else
      l = "#{l} #{w}"
    end
  end

  r << l unless l.empty?
  r
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

  if m = js.match(/(?<comment>(?:\/\/ .*\n)+)?interface (?<interface>\w+)Event extends Event {\n  event: '\w+';\n\n  body\??: {\n(?<body>.*)\n  };\n}/m)
    comment = m[:comment]
    iface = m[:interface] + 'EventBody'
    extends = 'Base'
    body = m[:body].split("\n").map { |l| l[2..] }.join("\n")

  elsif m = js.match(/(?<comment>(?:\/\/ .*\n)+)?interface (?<interface>\w+)Response extends Response {\n  body\??: {\n(?<body>.*)\n  };\n}/m)
    comment = m[:comment]
    iface = m[:interface] + 'ResponseBody'
    extends = 'Base'
    body = m[:body].split("\n").map { |l| l[2..] }.join("\n")

  elsif m = js.match(/(?<comment>(?:\/\/ .*\n)+)?interface (?<interface>\w+)(?: extends (?<extends>\w+))? {\n(?<body>.*)\n?}/m)
    comment = m[:comment]
    iface = m[:interface]
    extends = m[:extends] || 'Base'
    body = m[:body]

    if /.+(Event|Request|Response)$/ =~ iface
      puts "Skipping #{iface}" if defined?(PRINT_SKIP)
      return
    end

  elsif m = js.match(/(?<comment>(?:\/\/ .*\n)+)?type (?<type>\w+) = (?<values>(?:'\w+' \| )*'\w+');/)
    comment = m[:comment]
    iface = m[:type]
    enums = m[:values].split(' | ')

    comment_lines = []
    value_comments = {}
    comment.split("\n").each do |l|
      l = l[3..]
      if m = l.match(/^\s*‘?(?<value>\w+)’?: (?<comment>.*?)[,.]?$/)
        value_comments[m[:value]] = m[:comment]
      else
        comment_lines << l
      end
    end

    file = open_iface_file(iface)
    first = true
    file.puts wrap(comment_lines.join("\n"), 79).map { |c| "# #{c}" } if comment
    file.puts "class DAP::#{iface} < DAP::Enum"
    enums.each do |e|
      v = e[1...-1]
      file.puts wrap(value_comments[v], 77).map { |c| "  # #{c}" } if value_comments.key?(v)
      file.puts "  #{v.upcase} = new(#{e})"
    end
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


  file.puts wrap(comment.split("\n").map { |l| l[3..] }.join("\n"), 80).map { |c| "# #{c}" } if comment

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
    if type.match(/('\w+' \| )*'\w+'( | string)?/)
      file.write ", as: 'string'"
    elsif type == 'any' || type.match(/[^\w\[\]]/)
      # ignore
    elsif (m = type.match(/^([A-Z]\w*)(\[\])?$/)).nil? || m[1] == 'InvalidatedAreas'
      file.write ", as: '#{type}'"
    elsif m[2] == '[]'
      file.write ", as: many(DAP::#{type[0...-2]})"
    else
      file.write ", as: DAP::#{type}"
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
