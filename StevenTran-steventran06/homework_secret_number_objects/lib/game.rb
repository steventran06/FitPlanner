# this class may be complex
# we need to write logic to initialize a new game, and run the game loop
# we'll want to write a few separate methods for unique tasks so that our
# code is cleanly structured and easy to read.
require_relative './player.rb'
require_relative './secret_number.rb'

class Game
	attr_accessor :player, :secretnumber, :guess

	def initialize(player, secretnumber)
		@player = player
		@secretnumber = secretnumber
		guess = guess

	end

	def ask_user(question)
		puts question
		gets.strip
	end

	def guess_loop
		guess_num = 0
		tries_left = 3
		
		while true
			guess = ask_user "What is your guess?"

			if guess.to_i == @secretnumber.return_secret_num
				tries_left = tries_left - 1
				guess_num += 1
				puts "You're correct! You got it on try #{guess_num}!"
				break
			elsif guess.to_i > @secretnumber.return_secret_num
				tries_left = tries_left - 1
				guess_num += 1
				if tries_left == 1
					puts "Too high! You have #{tries_left} try left!"
				else
					puts "Too high! You have #{tries_left} tries left"
				end
			else
				tries_left = tries_left - 1
				guess_num += 1
				if tries_left == 1
					puts "Too low! You have #{tries_left} try left!"
				else
					puts "Too low! You have #{tries_left} tries left"
				end
			end

			if tries_left == 0
				puts "Sorry! You ran out of tries! The secret number was #{@secretnumber}."
				break
			end
		end
	end
end