
module TicTacToe

	class Move
		attr_accessor :pointX
		attr_accessor :pointY
		attr_accessor :player
	
		def initialize(x, y, player)
			@pointX = x
			@pointY = y
			@player = player
		end
	end
end
