#master_mind.rb
require_relative 'master_mind'
colors = ['R', 'B', 'Y', 'O', 'G', 'W']
print "Welcome to the game Mastermind, want to play? [y/n]: "
play_game = gets.downcase.strip
exit unless play_game == "y"

new_game = MasterMind.new


while new_game.win == false
	begin
	print "\nChoose color for the 1st box: "
	first_box = gets.upcase.strip
	end until colors.include?(first_box)
	begin
	print "\nChoose colose for the 2nd box: "
	second_box = gets.upcase.strip
	end until colors.include?(second_box)
	begin
	print "\nChoose colose for the 3rd box: "
	third_box = gets.upcase.strip
	end until colors.include?(third_box)
	begin
	print "\nChoose colose for the 4th box: "
	fourth_box = gets.upcase.strip
  end until colors.include?(fourth_box)
	new_game.verify_guess(first_box, second_box, third_box, fourth_box)
	break if new_game.counter == 12
end

if new_game.win == false
	print "Better luck next time"
end
endit = gets.chomp