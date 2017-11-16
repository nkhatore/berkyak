class Post < ApplicationRecord
	has_many :comments
	after_initialize :set_defaults, unless: :persisted?

	def set_defaults
	    self.votes = 0
  	end

end
