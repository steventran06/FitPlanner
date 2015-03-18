# this class will likely be simple, keeping track of the user's name.
class Player
	attr_accessor :name

	def initialize
		@name = ask_user "But first, what is your name?"
		puts "Hello #{@name}, you have 3 guesses to figure out the secret number!"
		puts ""
	end

	def ask_user(question)
		puts question
		gets.strip
	end
end
