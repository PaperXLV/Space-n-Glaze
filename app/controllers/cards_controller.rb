class CardsController < ApplicationController
   def create
      card = params[:card]
      token = params[:user]
      newCard = Card.new(card_params)
      
      
      newCard.save
   end
   
   
   private
    def card_params
      params.require(:card).permit(:first_name, :last_name, :email, :stripe_customer_token, :address)
    end
end