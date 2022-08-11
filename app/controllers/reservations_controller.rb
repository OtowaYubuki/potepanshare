class ReservationsController < ApplicationController
  def index
   @reservations = Reservation.all
  end

  def new
   @room = Room.find(params[:id])
   @reservation = Reservation.new(params.permit(:startday,:endday,:people,:totalday,:totalprice,:room_id))
   @user_id = current_user.id
  end

  def create
    @reservation = Reservation.new(params.permit(:startday,:endday,:people,:totalday,:totalprice,:room_id))
    if @reservation.save
      redirect_to reservation_confirm_path
    else
      render :new
    end
    
  end

	def confirm
    @room = Room.find(params[:reservation][:room_id])
    @reservation = Reservation.new(params.permit(:startday,:endday,:people,:totalday,:totalprice,:room_id))
  end

  def complete
    Reservation.create!
	end

  def back
	
	end

  private
    def reservation_params
      params.require(:reservation).permit(:startday,:endday,:people,:totalday,:totalprice,:room_id,:user_id) 
    end

end
