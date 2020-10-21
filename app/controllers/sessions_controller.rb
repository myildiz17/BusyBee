class SessionsController < ApplicationController
  # before_action :authenticate_user, :only => [:home]
  # before_action :save_login_state, :only => [:login, :login_attempt]  

  def create 
    @neighbor = Neighbor.find_by(name: params[:name])

    if @neighbor && @neighbor.authenticate(params[:password])
      redirect_to @neighbor
    else 
      redirect_to login_path
  end 

  def login
  end

  def login_attempt
    authorized_user = Neighbor.authenticate(params[:name],params[:login_password])
    if authorized_user
      flash[:notice] = "Welcome again, you logged in as #{authorized_user.name}"
      redirect_to(:action => 'home')
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color]= "purple"
      render "login"	
    end
  end

  def home
    render :home
  end
  
  def signup
  end 

  def logout
    session[:neighbor_id] = nil
    redirect_to :action => 'login'
    end
  end 
end
