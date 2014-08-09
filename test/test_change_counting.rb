require "minitest/autorun"

class ChangeCountingTest < MiniTest::Unit::TestCase
	def test_counting_change
		denominations = [100, 25, 10, 5, 1]
		amount = 157
		puts "Counting Change!"
		puts "\tRemaining = #{amount}"

		denominations.each do |denomination|
			count = amount / denomination
			amount = amount - (count * denomination);

			puts "\t#{denomination} Denomination = #{count}"
			puts "\tRemaining = #{amount}"			

			case denomination
				when 100
					assert_equal(1, count, "Wrong number of 100 denominations")
					assert_equal(57, amount, "Wrong remainder")
				
				when 25
					assert_equal(2, count, "Wrong number of 25 denominations")
					assert_equal(7, amount, "Wrong remainder")
				
				when 10
					assert_equal(0, count, "Wrong number of 10 denominations")
					assert_equal(7, amount, "Wrong remainder")
				
				when 5
					assert_equal(1, count, "Wrong number of 5 denominations")
					assert_equal(2, amount, "Wrong remainder")
				
				when 1
					assert_equal(2, count, "Wrong number of 1 denominations")
					assert_equal(0, amount, "Wrong remainder")
			end
		end
	end
end
