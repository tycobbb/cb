require "benchmark"

class Foo
  attr_reader :one, :two

  def initialize(one, two)
    @one = one
    @two = two
  end
end

Bar = Struct.new(
  :one, 
  :two
)

n = 10000000
Benchmark.bm do |x|
  x.report { n.times { Foo.new(:one, :two) } }
  x.report { n.times { Bar.new(:one, :two) } }
end

