class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: current_user.id)
  end

  def new
   @room = Room.find(params[:id])
   @user_id = current_user.id
   @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = current_user.id
    @totalprice = @reservation.room.price * @reservation.people * (@reservation.endday - @reservation.startday).to_i
    if @reservation.save
      flash[:notice] = "予約が完了しました"
      redirect_to reservation_path(@reservation.id)
    else
      render :new
    end
    
  end

	def show
    @reservation = Reservation.find(params[:id])
  end

  private
    def reservation_params
      params.require(:reservation).permit(:startday,:endday,:people,:totalday,:totalprice,:room_id).merge(user_id: current_user.id)
    end

end
