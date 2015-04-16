class Painting < ActiveRecord::Base
	validates :artist, :museum, :title, :image, presence: true

	def self.search(query, current_user_id)
		if query
			Painting.where('title LIKE :query and user_id == :current_user_id', query: "%#{query}%", current_user_id: "#{current_user_id}")
		else
			Painting.all
		end
	end

	def search(query)
	end

	belongs_to :user
end
