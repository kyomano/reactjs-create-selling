class MerchandiseCategoriesController < ApplicationController
    layout :set_layout

    def index
        @categories = MerchandiseCategory.all
    end

    def show
        @category = MerchandiseCategory.find_by(params[:id])
    end

    # def new
    # end
    # def create
    # end
    # def edit
    # end
    # def update
    # end
    # def delete
    # end
end
