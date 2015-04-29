class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:show, :edit, :update, :destroy]
    
  def index
    @exercises = Exercise.all
  end

  def new
    @exercise = Exercise.new
  end

  def create
    @exercise = Exercise.new(exercise_params)
    @exercise.user_id = current_user.id

    respond_to do |format|
      if @exercise.save
        format.html { redirect_to @exercise, notice: 'Exercise was successfully added!' }
      else
        format.html { render :new }
      end
    end
  end  

  def search
    @exercises = Exercise.search(params[:q])
    @search_message = 'found'
    if @exercises.count == 0
      @exercises = Exercise.first(50)
      @search_message = 'none'
    end
  end

  def show
  end

  def destroy
    @exercise.destroy
    respond_to do |format|
      format.html { redirect_to exercises_url, notice: 'Exercise was successfully destroyed.' }
    end
  end  

  def faq
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_exercise
    @exercise = Exercise.find(params[:id])
  end


  def exercise_params
    params.require(:exercise).permit(:exercise, :main_muscle_worked, :exercise_type, :guide, :level, :link, :picture)
  end
end
