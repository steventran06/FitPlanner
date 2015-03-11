require 'json'
require 'rest-client'
reddit_json = JSON.load(RestClient.get('http://reddit.com/.json'))

stories = reddit_json['data']['children']

stories.each do |story|
	puts "URL:  #{story['data']['url']}"
	puts "Upvotes:  #{story['data']['ups']}"
	puts ''	
end