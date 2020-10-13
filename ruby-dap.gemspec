Gem::Specification.new do |s|
    s.name        = 'ruby-dap'
    s.version     = '0.1.3'
    s.summary     = 'Debug Adapter Protocol'
    s.description = 'Debug Adapter Protocol parsers and formatters'
    s.authors     = ['Ethan Reesor']
    s.email       = 'ethan.reesor@gmail.com'
    s.files       = Dir.glob('lib/**/*.rb') + %w(LICENSE AUTHORS README.md CHANGELOG.md)
    s.homepage    = 'https://gitlab.com/firelizzard/ruby-dap'
    s.license     = 'Apache-2.0'
  end
