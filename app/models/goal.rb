class Goal < ApplicationRecord
	belongs_to	:user

	validates	:title, :description, :priority, :user_id, presence: true 
	validates	:priority, numericality: { only_integer: true }


end
