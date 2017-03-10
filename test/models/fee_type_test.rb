# == Schema Information
#
# Table name: fee_types
#
#  id              :integer          not null, primary key
#  name            :string
#  price           :float
#  vehicle_type_id :integer
#  parking_id      :integer
#  fee_time_id     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class FeeTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
