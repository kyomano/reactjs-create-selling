class MerchandiseReviewsController < ApplicationController
    layout :set_layout
    before_action :find_review, only: [:edit, :update, :delete]


    def index
        if params[:user_id]
            @reviews = MerchandiseReview.by_user(params[:user_id])
        end
    end

    def create
        @review = MerchandiseReview.new(merchandise_review_params)
        @review.save

        redirect_to merchandise_path(params[:merchandise_review][:merchandise_id])
    end

    def edit
    end

    def update
        if @review.update(review_params)
            redirect_to merchandise_path(@review)
        else
            render :edit
        end
    end

    def delete
            @review.delete
            redirect_to merchandise_path(params[:merchandise_id])
    end

    
    private
    
    def find_review
        @review = MerchandiseReview.find_by(id: params[:id])
    end

    def merchandise_review_params
        params.require(:merchandise_review).permit(:title, :body, :rating, :user_id, :merchandise_id)
    end
end
