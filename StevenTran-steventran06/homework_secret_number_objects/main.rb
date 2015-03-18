###############################################################################
#
# Object Oriented Secret Number
#
# Read the hints below and complete this file. This Lab
# is to practice your knowledge of object oriented programming.
#
###############################################################################
#
# Lets create an Object Oriented version of our Secret Number Game.
#
# The main.rb file is where the game begins. This class should tell the player who made it.
# Ask the player for their name and then instantiate the Game class.
#
# Your updated game should have 3 classes (SecretNumber, Game and Player). These
# files have already been created and included (using "require") for you in this file.
#
# Below is a description of each class and some guidelines for each.
#
# SecretNumber
#   This class should create and store a random number between 1-10.
#
# Player
#  Should ask the user for their name and store it in an attribute.
#
# Game
# This class holds most of the game logic and should:
#   Welcome players and inform them of the game rules.
#   Initialize the Player class.
#     Initialize the Secret Number class.
#     Prompt the user to choose a number, verify if the user guessed correctly.
#     If the user guesses incorrectly let them know if they were too high or too low.
#   Monitor how many guesses the player has before the game is over.
#
# Add helpful comments to your code to document what each section does.
#
# Tip: Refer to your secret number homework when helpful.

require_relative 'lib/game'
require_relative 'lib/player'
require_relative 'lib/secret_number'

# TODO: put code here print a welcome message for your user
puts "\n***************** The Secret Number Game ***************** \n \n"
puts "***************** Created by Steven Tran ***************** \n \n"

# TODO: put code here ask the user for their name, and save it in a Player object.


# TODO: put code here to initialize a new Game object, and start it

def game_start
	player = Player.new
	secretnumber = SecretNumber.new

	game_start = Game.new(player, secretnumber)
end

the_game = game_start

the_game.guess_loop