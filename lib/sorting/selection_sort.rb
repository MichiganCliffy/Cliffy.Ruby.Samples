
class SelectionSort
	def sort(data)
#		puts ""
#		puts data.join(' ')
		sortArray(data, 0)
		return data
	end

	private

	def sortArray(data, start)
		if (start < data.length - 1)
			swap(data, start, findMinimumIndex(data, start))
#			puts data.join(' ')
			sortArray(data, start + 1)
		end
	end
	

	def findMinimumIndex(data, start)
		minValue = data[start]
		minIndex = start

		i = start + 1;
		i.upto(data.length - 1) { |j|
			if (data[j] < minValue)
				minValue = data[j]
				minIndex = j
			end
		}

		return minIndex
	end

	def swap(data, a, b)
		if (a != b)
			temp = data[a]
			data[a] = data[b]
			data[b] = temp
		end
	end
end
