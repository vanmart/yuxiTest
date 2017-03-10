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

class Place < ApplicationRecord
  belongs_to :parking
  belongs_to :vehicle_type
  has_many :fees

  validates :name, :state, :parking_id, :vehicle_type, :presence => true

  rails_admin do
    configure :fees do
        visible false
    end
  end

  enum state: { free: 0,
                ocuppied: 1
              }
end
