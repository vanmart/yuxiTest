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

class FeeType < ApplicationRecord
  belongs_to :vehicle_type
  belongs_to :parking
  belongs_to :fee_time
  has_many :fees

  validates :name, :price, :vehicle_type_id, :parking_id, :fee_time_id, :presence => true

  rails_admin do
    configure :fees do
        visible false
    end
  end
end
