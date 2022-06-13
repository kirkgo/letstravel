class BookingsController < ApplicationController
  def new
    if current_user.credit_cards.any?
      session[:trip_id] = params[:trip_id]
      @trip = Trip.find(session[:trip_id])
      @booking = Booking.new
      @booking.build_passenger
    else
      redirect_to new_credit_card_path, notice: "It's necessary to add a credit card before booking!"
    end
  end

  def create
    @trip = Trip.find(booking_params[:trip_id])
    @booking = Booking.new(booking_params)
    if @booking.save
      Trip.update_booked_seats(booking_params[:trip_id])
      Ticket.create(booking_id: @booking.id, 
        price: @booking.trip.bus.seat_price, 
        extra_luggage: @booking.extra_luggage)
      redirect_to trips_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:trip_id, :extra_luggage, passenger_attributes: [:user_id, :name, :id_number])
  end
end
