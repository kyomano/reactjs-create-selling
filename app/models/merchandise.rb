class Merchandise < ApplicationRecord
    has_many :sales
    has_many :users, through: :sales
    has_many :merchandise_reviews
    belongs_to :creator
    validates :title, :description, :price, presence: true
    scope :by_category, -> (category_id) { where('merchandise_category_id == ?', category_id) }
    scope :by_creator, -> (creator_id) { where('creator_id == ?', creator_id) }


    def creator_name
        self.creator.username
    end
end
