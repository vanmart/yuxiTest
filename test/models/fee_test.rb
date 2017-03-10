# == Schema Information
#
# Table name: fees
#
#  id            :integer          not null, primary key
#  entry_date    :datetime
#  exit_date     :datetime
#  value         :float
#  fee_type_id   :integer
#  vehicle_plate :string
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class FeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
