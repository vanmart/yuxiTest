class HomeController < ApplicationController
  layout "application"
  skip_before_action :authenticate_user!, :only => [:index]

  def index
    @freePlaces = Place.where(state: 'free').where(parking_id: current_user.parking_id)
    @feeTypes = FeeType.where(parking_id: current_user.parking_id)
  end

  def saveIncome
      date = Time.now
      feeType = FeeType.where(name: params[:feeType_name]).last
      place = Place.where(vehicle_type_id: feeType.vehicle_type_id, state: "free",parking_id: current_user.parking_id).first
      puts("#{date}"+ "#{feeType.id}" + "#{current_user.parking_id}"+"#{params[:vehicle_plate]}"+"#{place.id}")
      f = Fee.create({entry_date: date, fee_type_id: feeType.id, vehicle_plate: params[:vehicle_plate], user_id: current_user.id, place_id: place.id })
      f.save
      respond_to do |response|
        response.json { render json: place}

        #delivered.json { render json: @delivered_orders }
        #devolution.json { render json: @devolutions }
      end
  end

  def saveExit
      exitDate = Time.now

      f = Fee.where(vehicle_plate: params[:vehicle_plate]).last
      f.update({exit_date: exitDate})
      f.save

      respond_to do |response|
        response.json { render json: f}

        #delivered.json { render json: @delivered_orders }
        #devolution.json { render json: @devolutions }
      end
  end

end
