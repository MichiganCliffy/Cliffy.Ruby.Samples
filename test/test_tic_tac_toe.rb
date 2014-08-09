require "minitest/autorun"
require "tic_tac_toe/move"
require "tic_tac_toe/board"

class TicTacToeTest < MiniTest::Unit::TestCase
	def test_move_construction
		move = TicTacToe::Move.new(1, 2, "X")
		assert_equal(1, move.pointX, "Point X is wrong")
		assert_equal(2, move.pointY, "Point Y is wrong")
		assert_equal("X", move.player, "Player name is wrong")
	end

	def test_board_construction
		board = TicTacToe::Board.new(3)
		assert_equal(board.size, 3, "The board is the wrong size")
		assert(board.moves != nil, "The moves array has not been initialized")
	end

	def test_board_add_single_move
		board = TicTacToe::Board.new(3)
		result = board.addMove(1, 1, "X")
		assert_equal(result, TicTacToe::MoveResult::CONTINUE, "Did not get the expected move result")
	end

	def test_board_add_duplicate_move
		board = TicTacToe::Board.new(3)
		board.addMove(1, 1, "X")
		result = board.addMove(1, 1, "Y")
		assert_equal(result, TicTacToe::MoveResult::INVALID, "Did not get the expected move result")
	end

	def test_board_get_player_moves
		board = TicTacToe::Board.new(3)
		board.addMove(1, 1, "X")
		board.addMove(3, 3, "Y")
		board.addMove(1, 2, "X")
		board.addMove(1, 3, "Y")
		board.addMove(2, 1, "X")
		moves = board.getPlayerMoves("X")
		assert(moves != nil, "No moves returned when there should be")
		assert_equal(moves.length, 3, "Wrong number of moves returned")
	end

	def test_board_get_player_moves_in_same_row
		moves = []
		moves << TicTacToe::Move.new(1, 1, "X")
		moves << TicTacToe::Move.new(1, 2, "X")
		moves << TicTacToe::Move.new(2, 2, "X")
		moves << TicTacToe::Move.new(2, 3, "X")

		board = TicTacToe::Board.new(3)
		count = board.getMovesInSameRow(moves, 1)
		assert_equal(count.length, 2, "Wrong Count")
	end

	def test_board_get_player_moves_in_same_column
		moves = []
		moves << TicTacToe::Move.new(1, 1, "X")
		moves << TicTacToe::Move.new(2, 1, "X")
		moves << TicTacToe::Move.new(2, 2, "X")
		moves << TicTacToe::Move.new(2, 3, "X")

		board = TicTacToe::Board.new(3)
		count = board.getMovesInSameColumn(moves, 1)
		assert_equal(count.length, 2, "Wrong Count")
	end

	def test_board_get_play_moves_in_left_to_right_diagonal
		moves = []
		moves << TicTacToe::Move.new(1, 1, "X")
		moves << TicTacToe::Move.new(2, 2, "X")
		moves << TicTacToe::Move.new(2, 3, "X")
		moves << TicTacToe::Move.new(1, 3, "X")

		board = TicTacToe::Board.new(3)
		count = board.getMovesInLeftToRightDiagonal(moves)
		assert_equal(2, count.length, "Wrong Count")
	end

	def test_board_get_play_moves_in_right_to_left_diagonal
		moves = []
		moves << TicTacToe::Move.new(1, 3, "X")
		moves << TicTacToe::Move.new(2, 2, "X")
		moves << TicTacToe::Move.new(2, 3, "X")
		moves << TicTacToe::Move.new(1, 3, "X")

		board = TicTacToe::Board.new(3)
		count = board.getMovesInRightToLeftDiagonal(moves)
		assert_equal(3, count.length, "Wrong Count")
	end

	def test_simple_game
		board = TicTacToe::Board.new(3)

		# -------------
		# | X |   |   |
		# -------------
		# |   |   |   |
		# -------------
		# |   |   |   |
		# -------------
		assert_equal(TicTacToe::MoveResult::CONTINUE, board.addMove(1, 1, "X"))

		# -------------
		# | X |   |   |
		# -------------
		# | Y |   |   |
		# -------------
		# |   |   |   |
		# -------------
		assert_equal(TicTacToe::MoveResult::CONTINUE, board.addMove(2, 1, "Y"))

		# -------------
		# | X | X |   |
		# -------------
		# | Y |   |   |
		# -------------
		# |   |   |   |
		# -------------
		assert_equal(TicTacToe::MoveResult::CONTINUE, board.addMove(1, 2, "X"))

		# -------------
		# | X | X | Y |
		# -------------
		# | Y |   |   |
		# -------------
		# |   |   |   |
		# -------------
		assert_equal(TicTacToe::MoveResult::CONTINUE, board.addMove(1, 3, "Y"))

		# -------------
		# | X | X | Y |
		# -------------
		# | Y | X |   |
		# -------------
		# |   |   |   |
		# -------------
		assert_equal(TicTacToe::MoveResult::CONTINUE, board.addMove(2, 2, "X"))

		# -------------
		# | X | X | Y |
		# -------------
		# | Y | X |   |
		# -------------
		# |   | Y |   |
		# -------------
		assert_equal(TicTacToe::MoveResult::CONTINUE, board.addMove(3, 2, "Y"))

		# -------------
		# | X | X | Y |
		# -------------
		# | Y | X |   |
		# -------------
		# |   | Y | X |
		# -------------
		assert_equal(TicTacToe::MoveResult::WIN, board.addMove(3, 3, "X"))
	end
end
