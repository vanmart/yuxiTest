# == Schema Information
#
# Table name: parkings
#
#  id         :integer          not null, primary key
#  name       :string
#  address    :string
#  email      :string
#  phone      :string
#  message    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Parking < ApplicationRecord
  has_many :user
  has_many :fee_types
  has_many :places

  validates :name, :address, :email,:phone, :presence => true

  rails_admin do
    configure :user do
        visible false
    end
    configure :fee_types do
        visible false
    end
    configure :fee do
        visible false
    end
  end

end
