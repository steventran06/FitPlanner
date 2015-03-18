# HINT: You will have to add an initialize method!
require 'json'
require 'rest-client'

class Reddit
  attr_accessor :stories
  def initialize
   @stories = []
  end

  def fetch_stories
    # Asking for initial subreddit to find stories:
    puts "What subreddit would you like to find story details for?"
    subreddit = gets.strip

    reddit_json = JSON.load(RestClient.get("http://www.reddit.com/r/#{subreddit}/.json"))
    reddit_json['data']['children'].each do |story|
      my_story = Story.new(story['data']['title'],story['data']['ups'],story['data']['url'],"www.reddit.com", story['data']['subreddit'])
      @stories << my_story
    end

 # If user input does not result in stories, program will prompt user until they enter a real subreddit:
    while @stories.empty? == true
      puts "That is not a real subreddit, please enter a proper one:"
      subreddit = gets.strip
      reddit_json = JSON.load(RestClient.get("http://www.reddit.com/r/#{subreddit}/.json"))
      
      reddit_json['data']['children'].each do |story|
        my_story = Story.new(story['data']['title'],story['data']['ups'],story['data']['url'],"www.reddit.com", story['data']['subreddit'])
        @stories << my_story
      end
    end    
    @stories
  end
end



