class CardsController < ApplicationController
   def create
      @order = current_order
      
      customer = Stripe::Customer.create(
          :email => params[:card][:email],
          :source => params[:user][:stripe_customer_token]
          )
      
      charge = Stripe::Charge.create(
          :amount => (@order.subtotal * 106.5).to_i, #again here, I should put the final total in the current_order so I'm not doing math on this step because thats sketch
          :currency => "usd",
          :description => "Space n Glaze Order",
          :customer => customer.id
          )
          
      newCustomer = Customer.new
      newCustomer.customer_id = customer.id
      newCustomer.email = customer.email
      newCustomer.save!
      
      @order.place_order
      @order.save
      flash[:success] = "Order Placed"
      @newOrder = Order.new
      @newOrder.save
      cookies[:order_id] = @newOrder.id
          
      redirect_to root_url
   end
   
   def new
       @card = Card.new
   end
   
   
   private
    def card_params
      params.require(:card).permit(:first_name, :last_name, :email, :stripe_customer_token, :address)
    end
end