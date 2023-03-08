class Creator < ApplicationRecord
    has_many :merchandises
    has_many :sales, through: :merchandises
    has_many :categories, through: :merchandises
    validates :email, :username, presence: true
    validates :email, :username, uniqueness: true
    validates :promo_discount, inclusion: {in: (0..100)}
    has_secure_password
    

    def find_creator_by_username
        @creator = Creator.find_by(username: params[:username])
    end

    def find_creator_by_email
        @creator = Creator.find_by(email: params[:email])
    end

    def merchandise_count
        self.merchandises.length
    end

end
