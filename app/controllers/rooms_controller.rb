class RoomsController < ApplicationController
  def index
  	@rooms = Room.all
  end

  def new
  end

  def edit
  end
end