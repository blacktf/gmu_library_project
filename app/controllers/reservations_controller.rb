class ReservationsController < ApplicationController

  before_action :set_book, only: [:new, :show, :edit, :update, :destroy]

  before_filter :authorize

  def index
    @reservations = Reservation.where( user: @current_user)
  end

  def show

  end

  def new
    @reservation = @book.reservations.new(reservation_params)
    if @reservation.save
      redirect_to my_reservations_path(@current_user), notice: 'Reservation created!'
    else
      render :new
    end
  end

  def create
    @reservation = @book.reservations.new(reservation_params)
    if @reservation.save
      redirect_to book_reservations_path(@user), notice: 'Reservation created!'
    else
      render :new
    end
  end

  def overdue
    if @current_user.admin
      @reservations = Reservation.overdue
    else
      redirect_to root_path
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:book_id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params[:reservation] ||= {}
      params[:reservation] = params[:reservation].merge(:reserved_on => DateTime.now, :due_on => 7.days.from_now,
        :user_id => @current_user.id, :book_id => params[:id])
      params.require(:reservation).permit( :reserved_on, :due_on, :user_id, :book_id)
    end

end
