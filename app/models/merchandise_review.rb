class MerchandiseReview < ApplicationRecord
    belongs_to :user
    belongs_to :merchandise
    validates :title, :body, :rating, presence: true
    validates :rating, inclusion: {in: (0..5)}
    scope :by_user, -> (user_id) { where('user_id == ?', user_id) }


    def find_reviews_by_merch
        @reviews = MerchandiseReview.find_by(merchandise_id: params[:id])
    end
end
