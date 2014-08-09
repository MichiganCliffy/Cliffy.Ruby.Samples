
class MergeSort
	def sort(data)
#		puts ""
#		puts data.join(' ')
		sortArray(data)
		return data
	end

	private
	def sortArray(data)
		if (data.length < 2)
			return
		end

		pivot = data.length / 2
		left = data[0..pivot-1]
		right = data[pivot..data.length]

		sortArray(left)
		sortArray(right)

		merge(data, left, right)
	end

	def merge(target, left, right)
		dataIndex = 0
		leftIndex = 0
		rightIndex = 0

		while (leftIndex < left.length && rightIndex < right.length)
			if (left[leftIndex] <= right[rightIndex])
				target[dataIndex] = left[leftIndex]
				leftIndex += 1
			else
				target[dataIndex] = right[rightIndex]
				rightIndex += 1
			end
			dataIndex += 1
		end

		while (leftIndex < left.length)
			target[dataIndex] = left[leftIndex]
			dataIndex += 1
			leftIndex += 1
		end

		while (rightIndex < right.length)
			target[dataIndex] = right[rightIndex]
			dataIndex += 1
			rightIndex += 1
		end

#		puts target.join(' ')
	end
end
