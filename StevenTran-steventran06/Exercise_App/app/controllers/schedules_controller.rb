class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  def index
    @date = Time.now.in_time_zone("Pacific Time (US & Canada)").strftime("%A")
    @schedules = current_user.schedules
    @todaysschedule = @schedules.where('day == :query', query: "#{@date}")
    @exercises = Exercise.all

    # Giphy API for FAIL gifs when there are no exercises for the day
    @giphy_json = JSON.load(RestClient.get('http://api.giphy.com/v1/gifs/search?q=fail&api_key=dc6zaTOxFJmzC'))
    @fail_gifs = @giphy_json['data']

    # New York Times API for Bodybuilding Articles
    @nyt_json = JSON.load(RestClient.get('http://api.nytimes.com/svc/search/v2/articlesearch.json?callback=svc_search_v2_articlesearch&q=bodybuilding&api-key=90e92bec8383fa6432bf7608f196e5fe%3A1%3A71947581'))
    @articles = @nyt_json['response']['docs']
  end

  def create
    @schedule = Schedule.new(schedule_params)
    @schedule.user_id = current_user.id
    set_random_exercise(@schedule)    

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Exercise was successfully added!' }
      else
        format.html { render :new }
      end
    end
  end

  def new
    @schedule = Schedule.new
    @schedules = Schedule.all
  end

  def edit
  end

  def show
  end

  def update
    if params[:new_exercise] == 'yes'
      set_random_exercise(@schedule)
    else
      if @schedule.update(schedule_params)
        set_random_exercise(@schedule)        
      else
        render :edit
      end
    end

    redirect_to schedules_path
  end

  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url, notice: 'Exercise was successfully destroyed.' }
    end
  end    

  private
  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  def schedule_params
    params.require(:schedule).permit(:day, :muscle_group, :user_id, :random)
  end

  def set_random_exercise(schedule)
    schedule.random_exercise = Exercise.where('main_muscle_worked LIKE :query', query: "#{@schedule.muscle_group}").sample.exercise
    @schedule.save
  end
end
