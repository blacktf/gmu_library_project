class ReservationsController < ApplicationController

  before_filter :authorize
  before_action :set_book, only: [:new, :show, :edit, :update, :destroy]
  before_action :set_reservation, only: [:show, :destroy]
  before_action :before_reserve, only: [:new, :create]

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
      redirect_to my_reservations_path(@current_user), notice: 'Error: No reservation created!'
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

  def destroy
    @reservation.destroy
    redirect_to my_reservations_path(@user), notice: 'Book returned!'
  end

  def overdue
    if @current_user.admin
      @reservations = Reservation.overdue
    else
      redirect_to root_path
    end
  end

  private

  def before_reserve
    if @book.reservations.count >= @book.total_in_library
      redirect_to my_reservations_path(@current_user), notice: 'No longer available. Plese try again later.'
      return
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_reservation
    @reservation = @book.reservations.where( user: @current_user).first
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params[:reservation] ||= {}
      params[:reservation] = params[:reservation].merge(:reserved_on => DateTime.now, :due_on => 6.days.from_now,
        :user_id => @current_user.id, :book_id => params[:id])
      params.require(:reservation).permit( :reserved_on, :due_on, :user_id, :book_id)
    end

end
