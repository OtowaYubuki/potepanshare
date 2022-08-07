class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:startday,:endday,:people,:totalday,:totalprice))
    @reservation.room_id = room.id
    @reservation.save
    redirect_to reservations_confirm_path
  end

  private
  def reservation_params
    params.require(:reservation).permit(:reservation).permit(:startday,:endday,:people,:totalday,:totalprice) 
  end

end
