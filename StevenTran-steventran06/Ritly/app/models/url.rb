class Url < ActiveRecord::Base
	validates :link, presence: true
	# validates :link, format: {with: /www.+/, message: "Please begin with www." }
	belongs_to :user
end
