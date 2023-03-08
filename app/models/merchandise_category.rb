class MerchandiseCategory < ApplicationRecord
     validates :name, presence: true
     has_many :merchandises
     has_many :creators, through: :merchandises
     
     def find_category(name)
         @category =  MerchandiseCategory.find_by(name: name)
     end

     def merch_count
          self.merchandises.length
     end
end
