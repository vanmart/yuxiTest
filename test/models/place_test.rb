# == Schema Information
#
# Table name: places
#
#  id              :integer          not null, primary key
#  name            :string
#  state           :integer
#  vehicle_type_id :integer
#  parking_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
