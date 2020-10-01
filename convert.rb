# Usage:
# cat interface.js | ruby convert.rb > lib/dap/interface.rb

def iface2file(iface)
  iface.gsub(/(^|[a-z])([A-Z])/) { |m| m.size == 1 ? m.downcase : m[0] + '_' + m[1].downcase }
end

def convert(js)
  if m = js.match(/interface (\w+)[\s\w]+{\n  body: {\n(.*)\n  };\n}/m)
    iface = m[1] + 'Body'
    body = m[2].split("\n").map { |l| l[2..] }.join("\n")

  elsif m = js.match(/interface (\w+)[\s\w]+{\n(.*)\n?}/m)
    iface = m[1]
    body = m[2]

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
    puts "No content for #{iface}"
    return
  end

  file = File.open("lib/dap/#{iface2file(iface)}.rb", 'w')
  first = true
  file.puts "class DAP::#{iface} < DAP::Base"
  vars.map do |comment, name, optional, type|
    if first
      first = false
    else
      file.puts
    end

    comment.scan(/   \* (.*)\n/).map { |c| file.puts "  # #{c[0]}" }
    file.write "  property :#{name}"
    unless /^[a-z]/ =~ type
      if m = type.match(/^\w+$/)
        file.write ", as: #{type}"
      elsif m = type.match(/^\w+\[\]$/)
        file.write ", as_array: #{type[0...-2]}"
      else
        file.write " # #{type}"
      end
    end
    file.puts
  end
  file.puts "end"
end

# convert($stdin.read)

IO.read('test').split("\n\n---\n\n").each { |s| convert(s) }
