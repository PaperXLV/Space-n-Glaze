class CardsController < ApplicationController
   def create
      token = params[:user][:stripe_customer_token]
      
      customer = Stripe::Customer.create(
          :email => params[:card][:email],
          :source => token,
          )
      
      charge = Stripe::Charge.create(
          :amount => current_order.subtotal * 1.065 * 100,
          :currency => "usd",
          :description => "Space n Glaze Order",
          :customer => customer
          )
          
      
       
      newCard = Card.new(card_params)
      newCard.save
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