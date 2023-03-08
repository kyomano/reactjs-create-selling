class ApplicationController < ActionController::Base
    layout :set_layout
 
    def current_creator
        Creator.find_by(id: session[:creator_id])
    end
        
    def set_layout
        if session[:user_id]
            "user"
        elsif session[:creator_id]
            "creator"
        else
            "application"
        end
    end

end
