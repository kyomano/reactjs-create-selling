class SessionsController < ApplicationController
    layout :set_layout

    def book_login
        @user = User.find_or_create_by(uid: request.env['omniauth.auth'][:uid]) do |u|
            u.password = request.env['omniauth.auth'][:uid]
            u.username = request.env['omniauth.auth'][:info][:name]
            u.email = request.env['omniauth.auth'][:info][:email]
        end
        session[:user_id] = @user.id

        redirect_to user_path(@user)
    end

    def get
        render "sessions/login"
    end

    def new  
    end

    def create
        user_or_creator_login
    end

    def destroy
        if session[:user_id]
            session.delete :u_c     #! can both be deleted in one line? can delete take multiple arguments?
            session.delete :user_id
            redirect_to '/'
        elsif session[:creator_id]
            session.delete :u_c
            session.delete :creator_id
            redirect_to '/'
        else
            redirect_to '/'
        end
    end

    #!create a cart and/or add Merchandise to the cart
    # def add_to_cart
    #     session[:user_cart] ||= []
    #     session[:user_cart] << params[:id]
    #     redirect_to merchandise_path(params[:id])
    # end

    # def remove_from_cart
    #     session[:user_cart].delete_if { |merch_id| merch_id == params[:id] }
    #     redirect_to merchandise_path(params[:id])
    # end

    def current_user    #! current user again
        User.find_by(id: session[:user_id])
    end

    def current_creator   
        Creator.find_by(id: session[:creator_id])
    end

    def current_user_or_creator?
        if session[:user_id] || session[:creator_id]
            true
        else
            false
        end
    end

    def current_user_or_creator
        if session[:user_id]
            current_user
        elsif session[:creator_id]
            current_creator       
        else
            false
        end
    end

    private
    def user_or_creator_login
        if params[:u_c] == "u"

            if !params[:username].blank?
               @user = User.find_by(username: params[:username])
               if @user
                session[:user_id] = @user.id

                redirect_to user_path(@user)
               else 
                @error = "Incorrect username or password"
                render "sessions/new"
               end

            elsif !params[:email].blank?
                @user = User.find_by(email: params[:email])
                if @user
                    session[:user_id] = @user.id

                    redirect_to user_path(@user)
                else
                    @error = "Incorrect username or password"
                    render "sessions/new"
                end
            end

        elsif params[:u_c] == "c"
            if !params[:username].blank?
                @creator = Creator.find_by(username: params[:username])
                if @creator
                    session[:creator_id] = @creator.id
                    redirect_to creator_path(@creator)
                else 
                    render "sessions/new"
                end

            elsif !params[:email].blank?
                @creator = Creator.find_by(email: params[:email])
                if @creator
                    session[:creator_id] = @creator.id
                    redirect_to creator_path(@creator)
                else
                    render "sessions/new"
                end
            else
                render "sessions/new"
            end
        else
            flash[:alert] = "Please choose User or Creator"
            render "sessions/new"
        end
    end

end