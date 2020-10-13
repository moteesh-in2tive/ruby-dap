require_relative '../lib/dap'

describe DAP::Encoding do
  describe '.encode' do
    it 'can handle unicode' do
      var = DAP::Response.new(command: 'variables', body: {
        variables: [
          {
            name: 'foo',
            value: 'bar - كل شيء سيء',
          }
        ]
      })

      body = expect_decode(described_class.encode(var))
      expect(to_sym(body)).to eq(var.to_wire)
    end

    it 'can handle invalid unicode' do
      var = DAP::Response.new(command: 'variables', body: {
        variables: [
          {
            name: 'foo',
            value: "bar - \xC2",
          }
        ]
      })

      body = expect_decode(described_class.encode(var))
      expect(to_sym(body)).to eq(var.to_wire)
    end
  end

  def expect_decode(s)
    lines = s.split("\r\n")
    expect(lines.size).to be(3)

    clh = lines.first.split(': ')
    expect(clh.size).to be(2)
    expect(clh.first).to eq('Content-Length')

    cl = clh.last.to_i
    body = lines.last
    expect(body.bytesize).to eq(cl)

    JSON.parse(body)
  end

  def to_sym(v)
    case v
    when Hash
      v.transform_keys(&:to_sym).transform_values { |v| to_sym(v) }
    when Array
      v.map { |v| to_sym(v) }
    else
      v
    end
  end
end
