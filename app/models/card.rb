class Card < ActiveRecord::Base
    validates :name, presence: true
    validates :email, presence: true
    validates :card_number, presence: true
    validates :card_code, presence: true
    validates :card_month, presence: true
    validates :address, presence: true
end