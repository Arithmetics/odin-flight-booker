class FlightsController < ApplicationController

  def show
    @flight = Flight.find(params[:id])
    @passenger_ids = [params[:passenger_id_1],
                      params[:passenger_id_2],
                      params[:passenger_id_3],
                      params[:passenger_id_4]]
    @passenger_ids.select! { |x| x != nil   }
    @passengers = []
    @passenger_ids.each do |x|
      @passengers.push(Passenger.find_by_id(x.to_i))
    end
  end

  def index
    @flights = Flight.all

    @airport_options = Airport.all.map{ |x| [ x.code, x.code ]}
    @airport_options.unshift(["",""])
    if params[:flight]
      if params[:flight][:from_airport] != ""
        #filter results
        @from_code = params[:flight][:from_airport]
        @flights = @flights.where(from_airport: Airport.find_by_code(@from_code) )
      end

      if params[:flight][:to_airport] != ""
        #filter results
        @to_code = params[:flight][:to_airport]
        @flights = @flights.where(to_airport: Airport.find_by_code(@to_code) )
      end

      if params[:flight]["start_date(1i)"] != ""
        #default select values
        @one = params[:flight]["start_date(1i)"].to_i
        @two = params[:flight]["start_date(2i)"].to_i
        @three = params[:flight]["start_date(3i)"].to_i
        @submitted_start_date = Date.new(@one, @two, @three)
        @flights = @flights.where("departure > ?", @submitted_start_date)
      end

      if params[:flight]["end_date(1i)"] != ""
        #default select values
        @one = params[:flight]["end_date(1i)"].to_i
        @two = params[:flight]["end_date(2i)"].to_i
        @three = params[:flight]["end_date(3i)"].to_i
        @submitted_end_date = Date.new(@one, @two, @three)
        #filter results
        @flights = @flights.where("departure < ?", @submitted_end_date)
      end

      if params[:flight][:submitted_num_passengers] != ""
        #default select values
        @submitted_num_passengers = params[:flight][:num_passengers]
      end

    end
  end



  private ###################################################3

  def flight_params
    params.permit(:flight).permit(:from_airport, :to_airport)
  end

end
