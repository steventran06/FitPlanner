class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]

  def index
    @stories = Story.all
    @user = current_user
  end

  # def show
  # end

  def new
    @story = Story.new
  end

  def edit
  end

  def search
    @stories = Story.search(params[:q])
    @search_message = 'found'
    if @stories.count == 0
      @stories = Story.all
      @search_message = 'none'
    end
  end

  def create
    @story = Story.new(story_params)
    @story.user_id = current_user.id


    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to stories_url, notice: 'story was successfully destroyed.' }
    end
  end  


  private
    # Use callbacks to share common setup or constraints between actions.
  def set_story
    @story = Story.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
  def story_params
    params.require(:story).permit(:title, :link, :upvotes, :category)
  end
end

