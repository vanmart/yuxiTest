# == Schema Information
#
# Table name: fee_times
#
#  id         :integer          not null, primary key
#  name       :string
#  seconds    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FeeTime < ApplicationRecord
  has_many :fee_type

  validates :name, :seconds, :presence => true

  rails_admin do
    configure :fee_type do
        visible false
    end

  end
end
