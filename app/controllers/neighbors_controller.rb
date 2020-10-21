class NeighborsController < ApplicationController
    # before_action :save_login_state, :only => [:new, :create]

  def show
      @neighbor = Neighbor.find(params[:id])
  end 

  def index
    @neighbors = Neighbor.all
    # session[:dog] || session[:dog] = []
    # @dog_neighbor = Neighbor.find(session[:dog])
  end

  def new 
    @neighbor = Neighbor.new
  end 

  def create 
    @neighbor = Neighbor.new(neighbor_params)

    if @neighbor.save
      redirect_to @user
    else
      redirect_to new_neighbor_path
    end
  end 

  private
  def neighbor_params
    params.require(:neighbor).permit(:name, :password, :password_confirmation)
  end

end