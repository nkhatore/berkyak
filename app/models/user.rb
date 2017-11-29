# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  studentid              :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  upvotes_received       :integer
#  posts_made             :integer
#  posts_upvoted          :text
#  auto_deleted_posts     :integer
#  lat                    :float
#  long                   :float
#  city                   :string
#  ip_address             :string
#  posts_downvoted        :text
#  downvotes_received     :integer
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :posts
  has_many :comments

  
  geocoded_by :ip_address,
    :latitude => :lat, :longitude => :long
  after_validation :geocode, :if => :ip_address_changed?

  reverse_geocoded_by :lat, :long do |obj,results|
    if geo = results.first
      obj.city = geo.city
    end
  end
  after_validation :reverse_geocode

  after_initialize :set_defaults, unless: :persisted?

  serialize :posts_upvoted, Array
  serialize :posts_downvoted, Array


	
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	def set_defaults
	    self.posts_made = 0
	    self.upvotes_received = 0 
      self.downvotes_received = 0
      self.posts_upvoted = []
      self.posts_downvoted = []
      self.auto_deleted_posts = 0
  end
end
