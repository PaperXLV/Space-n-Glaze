class Card < ActiveRecord::Base
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true
    validates :stripe_customer_token, presence: true
    validates :address, presence: true
    
end