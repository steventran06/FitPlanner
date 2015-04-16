class PaintingsController < ApplicationController
  before_action :set_painting, only: [:show, :edit, :update, :destroy]

  def index
    @paintings = current_user.paintings
  end

  def create
    @painting = Painting.new(painting_params)
    @painting.user_id = current_user.id

    respond_to do |format|
      if @painting.save
        format.html { redirect_to @painting, notice: 'Link was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def new
    @painting = Painting.new
  end

  def search
    @paintings = Painting.search(params[:q],current_user.id)
    @search_message = 'found'
    if @paintings.count == 0
      @paintings = current_user.paintings
      @search_message = 'none'
    end
  end

  def update
    respond_to do |format|
      if @painting.update(painting_params)
        format.html { redirect_to @painting, notice: 'Story was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @painting.destroy
    respond_to do |format|
      format.html { redirect_to paintings_url, notice: 'Story was successfully destroyed.' }
    end
  end  

  def edit
  end

  def show
  end

  private
  def set_painting
    @painting = Painting.find(params[:id])
  end

  def painting_params
    params.require(:painting).permit(:artist, :museum, :title, :image)
  end
end
