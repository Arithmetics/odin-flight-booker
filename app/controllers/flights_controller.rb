class FlightsController < ApplicationController

  def index
    @flights = Flight.all

    @airport_options = Airport.all.map{ |x| [ x.code, x.code ]}
    @airport_options.unshift(["",""])
    if params[:flight]
      if params[:flight][:from_airport] != ""
        @from_code = params[:flight][:from_airport]
        @flights = @flights.where(from_airport: Airport.find_by_code(@from_code) )
      end

      if params[:flight][:to_airport] != ""
        @to_code = params[:flight][:to_airport]
        @flights = @flights.where(to_airport: Airport.find_by_code(@to_code) )
        @regdate =  Date.new(params["date(1i)"].to_i,
                    params["date(2i)"].to_i,
                    params["date(3i)"].to_i)
      end

    end
  end



  private ###################################################3

  def flight_params
    params.permit(:flight).permit(:from_airport, :to_airport)
  end

end
