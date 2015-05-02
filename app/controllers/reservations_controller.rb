class ReservationsController < ApplicationController

  before_filter :authorize

  def index
    @reservations = Reservation.all
  end

end
