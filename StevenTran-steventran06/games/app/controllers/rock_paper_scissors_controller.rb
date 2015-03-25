class RockPaperScissorsController < ApplicationController
  def new
  end

  def show
  	@throw = rand(0..2)
  	@guess = params[:id].to_i
  	@player_tied = (@throw == @guess)
    @player_lost = @guess == 2 && @throw == 0
  	@player_won = (@guess == 0 && @throw == 2) || (@guess > @throw)

  	if @player_tied
  		@outcome_partial = 'tied'
   	elsif @player_lost
  		@outcome_partial = 'lose' 		
  	elsif @player_won
  		@outcome_partial = 'win'
  	else
  		@outcome_partial = 'lose'
    end

  	@image_array = ["rock_paper_scissors/rock.jpeg", "rock_paper_scissors/paper.jpeg", "rock_paper_scissors/scissors.jpeg"]
  end
end
