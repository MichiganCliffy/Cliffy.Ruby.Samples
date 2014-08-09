require "minitest/autorun"
require_relative "../lib/samples"

class TestSorting < MiniTest::Unit::TestCase
  def test_insertion_sort
	sorter = InsertionSort.new
	sorted = sorter.sort([6,3,9,2,7,8,1,4,5])
	0.upto(sorted.length - 1) { |i|
		assert_equal(sorted[i], i + 1, "Insertion sort failed")
	}
  end

  def test_selection_sort
	sorter = SelectionSort.new
	sorted = sorter.sort([6,3,9,2,7,8,1,4,5])
	0.upto(sorted.length - 1) { |i|
		assert_equal(sorted[i], i + 1, "Selection sort failed")
	}
  end

  def test_merge_sort
	sorter = MergeSort.new
	sorted = sorter.sort([6,3,9,2,7,8,1,4,5])
	0.upto(sorted.length - 1) { |i|
		assert_equal(sorted[i], i + 1, "Merge sort failed")
	}
  end
end
