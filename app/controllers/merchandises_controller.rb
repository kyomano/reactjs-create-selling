class MerchandisesController < ApplicationController
    layout :set_layout
    before_action :find_merch, only: [:show, :edit, :update, :delete]

        
    def filter
        @merchandise_categories = MerchandiseCategory.all
        @merchandises = Merchandise.by_category(params[:category])

        render "merchandises/index"
    end

    def index
        @merchandise_categories = MerchandiseCategory.all
        if params[:creator_id]
            @merchandises = Merchandise.by_creator(params[:creator_id])
        else
            @merchandises = Merchandise.all
        end
    end

    def show
        @reviews = @merchandise.merchandise_reviews.last(5)
        @review = @merchandise.merchandise_reviews.build
    end

    def new
        if params[:creator_id] && session[:creator_id] == params[:creator_id].to_i
            creator = Creator.find_by(id: params[:creator_id])
            @merchandise = creator.merchandises.build
        else
            redirect_to '/'
        end
    end

    def create
        creator = current_creator
        @merchandise = creator.merchandises.build(merch_params)
        if @merchandise.save
            redirect_to merchandise_path(@merchandise)
        else
            render "merchandises/new"
        end
    end

    def edit
    end

    def update
        if @merchandise.update(merch_params)
            redirect_to merchandise_path(@merchandise)
        else
            render :edit
        end
    end

    def delete
        @merchandise.delete
        redirect_to merchandises_path
    end


    private

    def find_merch
        @merchandise = Merchandise.find(params[:id])
    end

    def merch_params
        params.require(:merchandise).permit(:title, :description, :price, :creator_id ,:merchandise_category_id)
    end

end
