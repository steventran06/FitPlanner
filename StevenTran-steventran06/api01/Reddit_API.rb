require 'json'
require 'rest-client'
reddit_json = JSON.load(RestClient.get('http://reddit.com/.json'))

stories = reddit_json['data']['children']

stories.each do |story|
	if story['data']['subreddit'] == "fitness"

	puts "URL:  #{story['data']['url']}"
	puts "Upvotes:  #{story['data']['ups']}"
	puts "Subreddit:  #{story['data']['subreddit']}"
	puts ''	
end
end