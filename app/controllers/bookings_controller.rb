class BookingsController < ApplicationController
  def new
    session[:trip_id] = params[:trip_id]
    @trip = Trip.find(session[:trip_id])
    @booking = Booking.new
    @booking.build_passenger
  end

  def create
    @trip = Trip.find(booking_params[:trip_id])
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to checkout_booking(booking: @booking)
    else
      render :new
    end
  end

  def payment
    
  end

  private

  def booking_params
    params.require(:booking).permit(:trip_id, passenger_attributes: [:user_id, :name, :id_number])
  end
end
