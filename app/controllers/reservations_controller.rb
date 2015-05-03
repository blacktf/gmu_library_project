class ReservationsController < ApplicationController

  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  before_filter :authorize

  def index
    @reservations = Reservation.all
  end

  def show
;
  end

  def new
    @reservation = @user.reservations.new
    @reservation.reserved_on = DateTime.now
    @reservation.due_on = 7.days.from_now
  end

  def create
    @reservation = @user.reservations.new(reservation_params)
    if @reservation.save
      redirect_to user_reservations_path(@user), notice: 'Reservation created!'
    else
      render :new
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit( :reserved_on, :due_on)
    end

end
