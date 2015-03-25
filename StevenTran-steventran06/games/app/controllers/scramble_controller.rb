class ScrambleController < ApplicationController
  def new
  	@word_array = ["programming","butterfly","apple"]
  	@word = @word_array[rand(0..2)]
  end

  def show
    @guess = params[:guess]
    @word = params[:word]

    if @guess.downcase == @word.downcase
      @outcome_partial = 'win'
    else
      @outcome_partial = 'lose'
    end 
  end
end
