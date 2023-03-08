module CreatorsHelper

    def current_creator
        Creator.find_by(id: session[:creator_id])
    end
end
