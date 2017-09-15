class CheckoutsController < ApplicationController 
    def checkout
        @order_items = current_order.order_items
        @card = Card.new
    end
end