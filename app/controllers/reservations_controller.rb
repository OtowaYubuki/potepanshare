class ReservationsController < ApplicationController
  def index
    @rooms = Room.all
    @reservations = Reservation.all
  end

  def new
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(params.permit(:startday,:endday,:people,:totalday,:totalprice))
    @reservation.room_id = Room.find(params[:id])
    @reservation.save
    redirect_to reservations_confirm_path
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
      params.require(:reservation).permit(:startday,:endday,:people,:totalday,:totalprice) 
    end

end
