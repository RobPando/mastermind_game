class MasterMind
	attr_reader :hints, :win, :counter
	def initialize()
		starter_guide
		@hints = []
		@counter = 0
		@win = false
		@player_guess = []
		@record_hints = []
	end

	def starter_guide
		puts ""
		puts "This is your starting guide:"
		puts " 'R' = red\n 'B' = blue\n 'Y' = yellow\n 'O' = orange\n 'G' = green\n 'W' = white"
		puts "You have 12 chances to decipher the code"
		puts "If you get a color right it will be marked with 'o'"
		puts "If you get the color and the position right it will be marked with '*'"
		puts ""
		puts "-------------------------++++++++++++"
		puts "|"
		puts "-------------------------++++++++++++"
	end

	def display_board
		display = @counter
		while display >= 0
		puts "---------------++++++++++++++++"
		print " #{@player_guess[display][0]} | #{@player_guess[display][1]} | #{@player_guess[display][2]} | #{@player_guess[display][3]} |==|  [#{@record_hints[display][0]}|#{@record_hints[display][1]}|#{@record_hints[display][2]}|#{@record_hints[display][3]}]\n"
		puts "---------------++++++++++++++++"
		display -= 1
		end
	end

	def verify_guess(first, second, third, fourth)
		@player_guess << [first, second, third, fourth]
		give_hint
	end

	protected
	def give_hint
		@hints = []
		(0...4).each { |n| 
			if @player_guess[@counter][n] == pattern[n]
				@hints.unshift('*')
			elsif pattern.include?(@player_guess[@counter][n])
				@hints.unshift('o')
			else
				@hints.push(' ')
			end }
			@record_hints << @hints
			display_board
			@counter += 1
			@win = true if @hints == ['*','*','*','*']
	end

	private

	def pattern
		@pattern = ["Y", "R", "W", "B"]
	end

end
