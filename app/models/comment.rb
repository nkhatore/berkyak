# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  text       :string
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  votes      :integer
#  user_id    :integer
#

class Comment < ApplicationRecord
	belongs_to :post
	belongs_to :user
	after_initialize :set_defaults, unless: :persisted?

	def set_defaults
      self.votes = 0 
  	end
end
