class CardsController < ApplicationController
   def create
      
      
      customer = Stripe::Customer.create(
          :email => params[:card][:email],
          :source => params[:user][:stripe_customer_token]
          )
      
      charge = Stripe::Charge.create(
          :amount => (current_order.subtotal * 106.5).to_i, #again here, I should put the final total in the current_order so I'm not doing math on this step because thats sketch
          :currency => "usd",
          :description => "Space n Glaze Order",
          :customer => customer.id
          )
          
      redirect_to root_url
   end
   
   def new
       @card = Card.new
   end
   
   
   private
    def card_params
      params.require(:card).permit(:first_name, :last_name, :email, :stripe_customer_token, :address)
    end
    
    def customer_params
       #params.require(:customer).permit(:) 
    end
end