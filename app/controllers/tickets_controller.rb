class TicketsController < ApplicationController
  def index
    @passenger = Passenger.find(params[:passenger_id])
    @bookings = Booking.where(passenger_id: params[:passenger_id])
  end
end
