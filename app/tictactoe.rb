class Player
  
  attr_accessor :wins, :losses, :draws
  @@player_profiles = []
  
  def initialize(name)
 	@name = name
 	@wins = 0
 	@losses = 0
 	@draws = 0
 	@@player_profiles << self

  end

  def self.all
    @@player_profiles
  end 

  def stats
  	@stats = [:W => @wins,:L => @losses,:D => @draws]
  	puts stats
  end

  def win
  	@wins += 1
  end

  def lose
  	@losses +=1
  end
  
  def draw
  	@draws +=1
  end

  # def self.leaderboard
  # 	self.all.stats
  # end
end

#################

class Board

  @@board = Array.new(9, " ")
  
  def initialize
    numbered_board
    #position = gets.strip
    @current_board = @@board
  end
  
  def numbered_board
  	puts " 1 | 2 | 3 "
  	puts "-----------"
  	puts " 4 | 5 | 6 "
  	puts "-----------"
  	puts " 7 | 8 | 9 "
  end
  
  def display_board
  	puts " #{@current_board[0]} | #{@current_board[1]} | #{@current_board[2]} "
  	puts "-----------"
  	puts " #{@current_board[3]} | #{@current_board[4]} | #{@current_board[5]} "
  	puts "-----------"
  	puts " #{@current_board[6]} | #{@current_board[7]} | #{@current_board[8]} "
  end

end

################

class ActualGame

	attr_reader :current_player
	
  def initialize
		start_the_game			
	end

	def start_the_game
		puts "Welcome to the matrix...I mean tic-tac-toe..."
		puts "What is your name...for research purposes"
		user_name = gets.chomp
		@current_player ||= Player.new(user_name.capitalize)
		puts "'Would you like to play a game?' - Jigsaw"
		puts "X - You are X!"
		puts "O - ... you guessed it! YOU'RE O!!"
		puts "no - ... then why are you here?"
		puts "exit - probably a good idea since it's a nice day outside."
		@@user_input = gets.chomp
		if @user_input == "exit".downcase
			`exit`
		elsif @user_input == "no".downcase
			self.start_the_game
		elsif "X".downcase
			player_icon = "X"
		elsif "O".downcase
			player_icon = "O"
		end
	end

end


=begin
1. Welcome player to tic tac toe

2. Ask for name
	Show stats

3. Ask if they would like to play tic tac toe
	Valid responses:
		X => Player chooses X and GFlow begins
		O => Player chooses O and GFlow begins
		no => return to login prompt
		exit => exit tic tac toe

============Game loop begins=================
4. Display board with corresponding numbers
5. Ask user to enter a position (1-9)
6. Receive user input
7. Validate move
8. Change item in board array to corresponding X/O
9. Display new board with updated occupied positions
10. Check current positions for win condition
	a. compare current occupied positions with array of possible winning combinations
		i. if winning_combo[0] = X, && winning_combo[1] = X && winning_combo[2] = X 
			PLAYER WINS
				PLAYER.WIN
					ask user if they would like to play again
						start new instance of board and game
			PLAYER LOSES
				PLAYER.LOSE
					ask user if they would like to play again
						start new instance of board and game
			IF DRAW
				PLAYER.DRAW
					ask user if they would like to play again
						start new instance of board and game




=end



class GameFlow
	
   @@board = Array.new(9, " ")

  def initialize(player_icon, cpu_icon, board)
		Board.new   # prints numbered board and a blank board
    turn(board)

	end

  def move(board, location, current_player)
    board[location] = current_player
  end

  def position_taken?(board, location)
    board[location] != " " && board[location] != ""
  end

  def valid_move?(board, location)
    location.between?(0,8) && !position_taken?(board, location)
  end

  def turn(board)
    puts "Please enter 1-9:"
    input = gets.strip
    location = input.to_i-1
    if valid_move?(board, location)
      move(board, location)
      display_board(board)
    else
      turn(board)
    end
  end
end









