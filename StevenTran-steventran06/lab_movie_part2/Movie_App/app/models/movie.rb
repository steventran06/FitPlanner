class Movie < ActiveRecord::Base
	validates :title, :description, presence: true # Movie title can't be empty
	validates :year_released, numericality: { greater_than: 0 }
	validates :description, length: { minimum: 10 }
	def self.search(query)
		if query
			Movie.where('title LIKE :query or year_released LIKE :query or description LIKE :query', query: "%#{query}%")
		else
			Movie.all
		end
	end

	def search(query)
	end
end
