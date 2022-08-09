class ReservationsController < ApplicationController
  def index
    @rooms = Room.all
    @reservations = Reservation.all
  end

  def new
   @reservation = Reservation.new(params.permit(:startday,:endday,:people,:totalday,:totalprice,:room_id))
   @room = Room.find(params[:room_id])
   @user_id = current_user.id
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:startday,:endday,:people,:totalday,:totalprice,:room_id, :user_id))
    @room = Room.find(params[:room_id])
    if @reservation.save
      redirect_to reservations_confirm_path
    else
      render "create"
    end
    
  end




	def confirm
    @reservations = @reservation.room_id
	end

  def complete
	end

  def back
	
	end

  private
    def reservation_params
      params.require(:reservation).permit(:startday,:endday,:people,:totalday,:totalprice,:room_id) 
    end

end
