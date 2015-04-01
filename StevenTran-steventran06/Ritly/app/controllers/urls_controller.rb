class UrlsController < ApplicationController
  def create
  	@url = Url.new(url_params)
  	@url.hash_code = rand(10000)

  	respond_to do |format|
  		if @url.save
  			format.html { redirect_to @url, notice: 'Link was successfully created.' }
  		else
  			format.html { render :new }
  		end
  	end
  end

  def redirect
  	@url = Url.find_by_hash_code(params[:hash_code])
  	redirect_to "http://#{@url.link}"
  end

  def new
  	@urls = Url.all
  	@url = Url.new
  end

  def show
  	@url = Url.find(params[:id])
  end

  private
  def url_params
  	params.require(:url).permit(:link, :hash_code)
  end
end
