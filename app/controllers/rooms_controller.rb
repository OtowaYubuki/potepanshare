class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(params.require(:room).permit(:name,:introduction,:price,:adress,:image))
    @room.user_id = current_user.id
    @room.save
    redirect_to rooms_path
  end

  def show
    @rooms = current_user.rooms
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  def search
    @rooms = Room.search(params[:search])
  end

  private
  def room_params
    params.require(:room).permit(:name,:introduction,:price,:adress,:image) 
  end

end
