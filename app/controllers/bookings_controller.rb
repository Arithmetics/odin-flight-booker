class BookingsController < ApplicationController
  before_action :validate_passenger, only: :create

  def new
    @flight = Flight.find(params[:booking][:flight_id])
    @num_passengers = params[:booking][:num_passengers].to_i
  end


  def create
    @num_passengers = params[:num_passengers].to_i
    @flight = Flight.find(params[:flight_id])
    @passenger_ids = [nil,nil,nil,nil]
    @num_passengers.times do |num|
      @passenger = Passenger.create(name: params["passenger_name#{num}"],
                                 email: params["passenger_email#{num}"])
      @flight.bookings.create(passenger: @passenger)
      @passenger_ids[num] = @passenger.id
    end
      redirect_to controller: 'flights',
                  action: 'show',
                  id: @flight.id,
                  passenger_id_1: @passenger_ids[0],
                  passenger_id_2: @passenger_ids[1],
                  passenger_id_3: @passenger_ids[2],
                  passenger_id_4: @passenger_ids[3]

  end

  def validate_passenger
  end


  private ##################################################

  def booking_params
    params.require(:booking).permit(:flight_id, :passenger_id)
  end

  def passenger_params
    params.require(:passenger).permit(:passenger[:name],:passenger[:email])
  end




end
