require "minitest/autorun"
require_relative "../lib/samples"

class TestSamples < MiniTest::Unit::TestCase
  def test_sanity
	test = Samples.new
  end
end
