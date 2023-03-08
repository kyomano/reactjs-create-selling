module SessionsHelper

    # def current_user
    #     session[:user_id] ? true:false
    # end
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
    
end