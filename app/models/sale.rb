class Sale < ApplicationRecord
    belongs_to :merchandise
    belongs_to :user
    has_many :creators, through: :merchandises
    validates_presence_of :shipping_address
    
end
