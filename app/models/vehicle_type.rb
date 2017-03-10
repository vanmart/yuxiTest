# == Schema Information
#
# Table name: vehicle_types
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class VehicleType < ApplicationRecord
  has_many :fee_types
  has_many :places

  validates :name, :presence => true

  rails_admin do
    configure :fee_types do
        visible false
    end
  end
end
