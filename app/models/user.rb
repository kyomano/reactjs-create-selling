class User < ApplicationRecord
    has_many :sales
    has_many :merchandises, through: :sales
    has_many :merchandise_reviews
    validates :username, :email, presence: true
    validates :email, :username, uniqueness: true
    has_secure_password
    

end
