# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  text        :string
#  votes       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  location_id :integer
#  time        :string
#

class Post < ApplicationRecord
	#a
	belongs_to :user
	belongs_to :location
	#b
	has_many :comments
	after_initialize :set_defaults, unless: :persisted?

	def set_defaults
	    self.votes = 0
  	end
  	def self.search(search)
  		# where("name LIKE ? OR ingredients LIKE ? OR cooking_instructions LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
  		where("text LIKE ?", "%#{search}%") 

	end
  	
end
