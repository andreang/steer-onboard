class RoomsController < ApplicationController

before_action :find_room, only: [:show, :edit, :update, :destroy]
before_action :find_room, only: [:new, :create, :edit, :update, :destroy]

  def index
  	@rooms = Room.all
  end

  def show
    # find_room
  end

  def new
  @user = current_user
   @rooms = Room.new
  end

  def create
   @rooms = Room.new(room_params)
   @room.user_id = current_user.id
   if @room.save
    flash[:success] = "Your new room has been posted."
    redirect_to room_path(@room)
  else
    flash[:error] = "Sorry, try again."
    render :new
  end
  end

  def edit
  # find_room
  @user = current_user
  end

  def update
  # find_room
   if @room.update(room_params)
    flash[:success] = "#{@room.name} has been updated."
    redirect_to room_path(@room)
  else
    flash[:error] = "Sorry, try again."
    render :edit
  end
  end

  def destroy
      @room.destroy
      flash[:success] = "#{@room.name} has been deleted."
      @room = nil
      redirect_to root_path
  end

  private
  def room_params
    params.require(:room).permit(
    :price_in_pence,
    :name,
    :description,
    :availability,
    :address,
    :latitude,
    :longitude,
    :phone_number,
    :no_of_rooms,
    :max_guests,
    :pets,
    :used_id)
  end

  def find_room
    @room = Room.find(params[:id])
  end

end
