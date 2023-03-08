class CreatorsController < ApplicationController
    layout :set_layout
    before_action :find_creator, only: [:show, :edit, :update, :delete]
    
    def index
        @creators = Creator.all
    end

    def show     
    end

    def new
        @creator = Creator.new
    end

    def create
        @creator = Creator.new(creator_params)
        if @creator.save
            session[:creator_id] = @creator.id
            redirect_to creator_path(@creator)
        else
            @creator = Creator.create(creator_params)     
            render "creators/new"
        end
    end

    def edit     
    end

    def update
        if @creator.update(creator_params)
            redirect_to creator_path(@creator)
        else
            render :edit
        end
    end

    def delete
        @creator.destroy
        redirect_to logout_path
    end

    # def current_creator
    #     Creator.find_by(id: session[:creator_id])
    # end

    private
    def find_creator
        @creator = Creator.find_by(id: params[:id])
    end
    def creator_params
        params.require(:creator).permit(:email, :username, :password, :about, :age, :location, :promo_code, :promo_discount)
    end
end
