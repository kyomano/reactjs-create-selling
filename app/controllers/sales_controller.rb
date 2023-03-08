class SalesController < ApplicationController
    layout :set_layout
    before_action :find_sale, only: [:show, :edit, :update, :delete]
    
    def index
        if params[:creator_id] && params[:creator_id].to_i == session[:creator_id]
            creator = Creator.find_by(id: params[:creator_id])
            sales = creator.merchandises.map do |merch|
                merch.sales
            end
            @sales = sales.flatten 

        elsif params[:user_id] && params[:user_id].to_i == session[:user_id]
            user = User.find_by(id: params[:user_id])
            @sales = user.sales
        else
            redirect_to '/'
        end  
    end
    
    def show
        if params[:creator_id] && params[:creator_id].to_i == session[:creator_id]
            creator = Creator.find_by(id: params[:creator_id])
            @sale = creator.sales.find_by(id:params[:id])
        elsif params[:user_id] && params[:user_id].to_i == session[:user_id]
            user = User.find_by(id: params[:user_id])
            @sale = user.sales.find_by(id:params[:id])
        else
            redirect_to '/'
        end  
    end

    def new
        if params[:merchandise_id]
            @sale= Sale.new
            @merchandise = Merchandise.find_by(id: params[:merchandise_id])
        else
            redirect_to '/'
        end
    end

    def create
        @sale = current_user.sales.build(sale_params)
        if @sale.save
            redirect_to user_sale_path(current_user, @sale)
        else 
            redirect_to new_merchandise_sale_path(params[:sale][:merchandise_id])
        end
    end


    private
    def sale_params
        params.require(:sale).permit(:user_id, :merchandise_id, :promo_code, :tip, :shipping_address)
    end

    def current_user
        User.find_by(id: session[:user_id])  #!current_user defined multiple times. Where does it need to be?
    end

    def find_sale
        @sale = Sale.find_by(id: params[:id])
    end
end
