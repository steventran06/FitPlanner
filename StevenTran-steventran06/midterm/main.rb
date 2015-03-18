# Program will list all stories and details for a subreddit that you specify!

require_relative 'lib/story'
require_relative 'lib/reddit'

stories = []

reddit_stories = Reddit.new
stories = reddit_stories.fetch_stories

stories.each do |story|
	story.headline
end

