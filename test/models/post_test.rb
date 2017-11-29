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

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
