class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
    binding.pry
    @rooms = Room.all
    binding.pry
  end

  def new
   @room = Room.find(params[:id])
   @reservation = Reservation.new
   @user_id = current_user.id
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:startday,:endday,:people,:totalday,:totalprice,:room_id))
    if @reservation.save
      redirect_to reservation_confirm_path
    else
      render :new
    end
    
  end

	def confirm
    @room = Room.find(params[:reservation][:room_id])
    @reservation = Reservation.new(params.require(:reservation).permit(:startday,:endday,:people,:totalday,:totalprice,:room_id))
  end

  private
    def reservation_params
      params.require(:reservation).permit(:startday,:endday,:room_id).merge(user_id: current_user.id)
    end

end
