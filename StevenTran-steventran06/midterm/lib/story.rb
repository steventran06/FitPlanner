require_relative './reddit.rb'

class Story
	attr_accessor :title, :ups, :url, :site, :subreddit

	def initialize(title, ups, url, site, subreddit)
		@title = title
		@ups = ups
		@url = url
		@site = site
		@subreddit = subreddit
	end

  	def headline
  		puts "Title: #{@title}"
  		puts "Upvotes: #{@ups}"
  		puts "URL: #{@url}"
  		puts "Site: #{@site}"
  		puts "Subreddit: #{@subreddit}\n \n"
  	end
end
