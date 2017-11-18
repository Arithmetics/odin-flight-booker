class FlightsController < ApplicationController

  def index
    @flights = Flight.all

    if params[:flight]
      if params[:flight][:from_airport] != ""
        @from_code = params[:flight][:from_airport]
        @flights = @flights.where(from_airport: Airport.find_by_code(@from_code) )
      end

      if params[:flight][:to_airport] != ""
        @to_code = params[:flight][:to_airport]
        @flights = @flights.where(to_airport: Airport.find_by_code(@to_code) )
      end

    end
  end



  private ###################################################3

  def flight_params
    params.permit(:flight).permit(:from_airport, :to_airport)
  end

end
