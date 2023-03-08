module MerchandiseReviewsHelper

    def find_reviews_by_merch(merch)
        @reviews = merch.reviews.all
    end

    def recent_reviews(merch)
        @reviews = merch.reviews.last(5)
    end
end
