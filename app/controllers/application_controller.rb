class ApplicationController < ActionController::Base
    # before_action :get_neighbor

    def schedule
        session[:schedule] ||= []
    end 

    # def get_neighbor
    #     neighbor_name session[:current_neighbor]
    # end 

    def add_to_schedule
        schedule << params[:neighbor_id]
    end 
    
    def get_schedule
        @scheduled_jobs = Job.find(schedule)
    end 

    # def neighbor_name
    #   @neighbor = Neighbor.find(params[:id])
    # end 

    protected 

    def neighbor_name
      @neighbor = Neighbor.find(params[:id])
    end 

    def authenticate_user
        if session[:neighbor_id]
            @current_neighbor = Neighbor.find session[:neighbor_id] 
            return true	
        else
            redirect_to(:controller => 'sessions', :action => 'login')
            return false
        end
    end

    def save_login_state
        if session[:neighbor_id]
            redirect_to(:controller => 'sessions', :action => 'home')
            return false
        else
            return true
        end
    end 
end 


