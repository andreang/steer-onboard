class OrdersController < ApplicationController
  def index
  end

  def new
  	@room = Room.find(params[:room_id])
  	@order = @room.orders.new
  end

  def create
  	 @room = Room.find(params[:room_id])
  	@order = @room.orders.new(order_params)
  	if @order.save
  		Stripe::Charge.create(
  			:amount => @order.room.price_in_pence,
 			:currency => "gbp",
 			:card => @order.stripe_token, # obtained with Stripe.js
  			:description => "Charge for #{@order.user.email}}"
			)
  			redirect_to user_order_path(@user, @order)
  	else
  		render :new
  	end
  	#Create charge here
  end

  private
  def order_params
  	params.require(:order).permit(:user_id, :room_id, :stripe_token)
end
