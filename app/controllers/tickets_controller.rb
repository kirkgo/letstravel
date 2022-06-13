class TicketsController < ApplicationController
  def index
    @passenger = Passenger.find(params[:passenger_id])
    @bookings = Booking.where(passenger_id: params[:passenger_id])
  end

  def refund
    @ticket = Ticket.find(params[:ticket_id])
    booking = Booking.find(@ticket.booking.id)
    trip = Trip.find(booking.trip.id)
    if @ticket.refund
      booking.update(status: 'cancelled')
      trip.revert_booked_seat
      redirect_to tickets_path(passenger_id: booking.passenger.id), notice: "Ticket was successfully refunded."
    else
      redirect_to tickets_path(passenger_id: booking.passenger.id), alert: "Ticket cannot be refunded because refund is allowed only 30 minutes before departure time."
    end
  end
end
