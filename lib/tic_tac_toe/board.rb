module TicTacToe

	class Board
		attr_accessor :moves #make this read only
		attr_accessor :size #make this read only

		def initialize(boardSize)
			@moves = Array.new
			@size = boardSize
		end

		def addMove(x, y, player)
			move = Move.new(x, y, player)

			if (!doesMoveExist(move))
				@moves << move

				playerMoves = getPlayerMoves(move.player)
				if (playerMoves.length >= @size)
					inSameRow = getMovesInSameRow(playerMoves, move.pointX)
					if (inSameRow.length == @size)
						return MoveResult::WIN
					end

					inSameColumn = getMovesInSameColumn(playerMoves, move.pointY)
					if (inSameColumn.length == @size)
						return MoveResult::WIN
					end

					inLeftToRightDiagonal = getMovesInRightToLeftDiagonal(playerMoves)
					if (inLeftToRightDiagonal.length == @size)
						return MoveResult::WIN
					end

					inRightToLeftDiagonal = getMovesInLeftToRightDiagonal(playerMoves)
					if (inRightToLeftDiagonal.length == @size)
						return MoveResult::WIN
					end
				end

				return MoveResult::CONTINUE;
			end
		
			return MoveResult::INVALID
		end

		def doesMoveExist(move)
			return @moves.any? { |x| x.pointX == move.pointX && x.pointY == move.pointY }
		end

		def getPlayerMoves(player)
			return @moves.select { |x| x.player == player }
		end

		def getMovesInSameRow(playerMoves, row)
			return playerMoves.select { |x| x.pointX == row }
		end

		def getMovesInSameColumn(playerMoves, column)
			return playerMoves.select { |x| x.pointY == column }
		end

		def getMovesInLeftToRightDiagonal(playerMoves)
			return playerMoves.select { |x| x.pointX == x.pointY }
		end

		def getMovesInRightToLeftDiagonal(playerMoves)
			return playerMoves.select { |x| @size - (x.pointX - 1) == x.pointY }
		end
	end

end
