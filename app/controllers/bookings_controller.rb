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
      redirect_to checkout_path(booking_id: @booking.id)
    else
      render :new
    end
  end

  def checkout
    @booking = Booking.find(params[:booking_id])
    @ticket = Ticket.new(booking_id: @booking.id, 
                            status: 0, price: @booking.trip.bus.seat_price, 
                            extra_luggage: @booking.extra_luggage)
    if @ticket.save
      @booking.update(status: :confirmed)
      redirect_to trips_path
    else
      redirect_to buses_path
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:trip_id, passenger_attributes: [:user_id, :name, :id_number])
  end
end
