class Story < ActiveRecord::Base
	validates :title, :link, :upvotes, :category, presence: true # Movie title can't be empty
	validates :upvotes, numericality: { greater_than: 0 }
	def self.search(query)
		if query
			Story.where('title LIKE :query or category LIKE :query', query: "%#{query}%")
		else
			Story.all
		end
	end

	def search(query)
	end
end
