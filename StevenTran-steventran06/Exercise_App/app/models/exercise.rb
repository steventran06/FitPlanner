class Exercise < ActiveRecord::Base
	validates :exercise, :main_muscle_worked, :exercise_type, :guide, :level, :link, presence: true # Movie title can't be empty
	belongs_to :user
	def self.search(query)
		if query
			Exercise.where('main_muscle_worked LIKE :query or level LIKE :query or exercise LIKE :query or guide LIKE :query', query: "%#{query}%")
		else
			Exercise.all
		end
	end

end
