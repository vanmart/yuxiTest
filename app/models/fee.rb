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

class Fee < ApplicationRecord
  belongs_to :fee_type
  belongs_to :user
  belongs_to :place

  validates :entry_date, :fee_type_id, :user_id,:vehicle_plate, :presence => true

  #once the register is initializated  (Creating a new lease)
  after_initialize do |fee|
    fee.entry_date = Time.now if entry_date.blank?
  end

  before_update :update_fee_value_when_date_change, :if => ":exit_date_changed? || :fee_type_id_changed?  "

  before_save :update_place_state_to_ocuppied, :if => :entry_date_changed?
  before_save :update_place_state_to_free, :if => :exit_date_changed?

  def update_place_state_to_ocuppied
    place = Place.find(self.place_id)
    place.state = 'ocuppied'
    place.save
  end

  def update_place_state_to_free
    place = Place.find(self.place_id)
    place.state = 'free'
    place.save
  end

  def update_fee_value_when_date_change
    if self.exit_date.present?
      self.exit_date = Time.now if self.exit_date.blank?
      lType = FeeType.find(self.fee_type_id)
      lTime = FeeTime.find(lType.fee_time_id)
      seconds = self.exit_date - self.entry_date

      if lTime.name == "hour" # 1 hour or fraction value
          hours = (seconds.to_f / 60 / 60).round(1).ceil # THIS LINE approaches the nearest whole number of 0.1 to 1 and gives approximately 3 minutes to put the cost of the fraction
          self.value = hours * lType.price
      else
        self.value = lType.price * (seconds / lTime.seconds.to_f)
      end
    end
  end

  #ANABLE THIS FUNCTION IF YOU WANNA SEE A ESTIMATED COST AT THE MOMENT...
  after_find do |fee|
    exit_date = Time.now
    lType = FeeType.find(fee.fee_type_id)
    lTime = FeeTime.find(lType.fee_time_id)
    segundos = exit_date - fee.entry_date
       #round(1) redondea la cantidad decimal a la cantidad de digitos especificado 1
       #cantidades como  2.3547868735 sera 2,4
       # 2.07 sera 2
       # ceil redondea al float a el entero mas cercano
       # 0.01 = 1
       # 2.3 = 3
       #horas = (segundos.to_f / 60 / 60).round(2).ceil  ESTA LINEA aproxima a el entero mas proximo desde 0.01 a 1
       #ocea desde el momento que se crea cobra la hora o fraccion
    if fee.value.blank?
      if lTime.name == "hora"# 1 horas
         horas = (segundos.to_f / 60 / 60).round(1).ceil #ESTA LINEA aproxima a el entero mas proximo desde 0.1 a 1 y da unos 3 minutos para poner el varlor de la fraccion
         fee.value = horas * lType.price
      end
        fee.value = lType.price
    end

    #fee.value = segundos#lType.price
    #elsif segundos <= lTime.seconds.to_f
     #self.value = (segundos / lTime.seconds.to_f)*lType.price
    # fee.value = lType.price
    #else
    #  fee.value = lType.price * (segundos / lTime.seconds.to_f)
    #end #ya tengo horas y segundos
  end



end
