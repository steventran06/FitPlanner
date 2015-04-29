class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :edit, :update, :destroy]

  def index
    @favorites = current_user.favorites
  end

  def create
    if params[:new_favorite]
      @favorite = Favorite.new
      @favorite.user_id = current_user.id
      @favorite.favorite_exercise = params[:new_favorite]
      @favorite.save

      redirect_to favorites_path

    else
      respond_to do |format|
        if @favorite.save
          format.html { redirect_to @favorite, notice: 'Favorite was successfully added!' }
        else
          format.html { render :new }
        end
      end
    end

  end

  def update
    if params[:new_favorite].exists?
    @favorite.user_id = current_user.id
    else
      if @favorite.update(favorite_params)
        # set_random_exercise(@favorite)        
      else
        render :edit
      end
    end

    redirect_to favorites_path
  end

  def destroy
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to favorites_url, notice: 'Favorite was successfully destroyed.' }
    end
  end    

  private
  def set_favorite
    @favorite = Favorite.find(params[:id])
  end

  def favorite_params
    params.require(:favorite).permit(:user_id, :favorite_exercise)
  end

  def set_random_exercise(favorite)
    favorite.favorite_exercise = Exercise.where('main_muscle_worked LIKE :query', query: "#{@favorite.muscle_group}").sample.exercise
    @favorite.save
  end  
end
