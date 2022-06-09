class TripsController < ApplicationController
  def index
    @trips = Trip.filter(params.slice(:departure, :arrival, :departure_date))
  end

  private 

  def filtering_params(params)
    params.slice(:departure, :arrival, :departure_date)
  end
end
