
class InsertionSort
	def sort(data)
#		puts ""
#		puts data.join(' ')
		1.upto(data.length - 1) { |i|
			check = data[i]
			j = i - 1
			while j >= 0 and data[j] > check
				data[j+1] = data[j]
				j-=1
			end
			data[j+1] = check

#			puts data.join(' ')
		}
		return data
	end
end
