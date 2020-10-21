class NeighborsController < ApplicationController

  before_action :set_neighbor, only: [:show, :edit, :update, :destroy]
  
  def index
    @neighbors = Neighbor.all
  end

  def show
  end

  def new
    @neighbor = Neighbor.new
  end

  def edit
    @neighbor = Neighbor.find(params[:id])
    @children = Child.all
    # render :edit
  end

  def create
    neighbor = Neighbor.create(neighbor_params)
  
    if neighbor.save 
        redirect_to camper_path(neighbor)
    else
      flash[:errors] = neighbor.errors.full_messages
      
      redirect_to new_neighbor_path
    end
  end


  def update
    @neighbor = Neighbor.find(params[:id])
    @neighbor.update(neighbor_params)
    
    redirect_to snail_path(@neighbor)
  end 

  def destroy 
    @neighbor = Neighbor.find(params[:id])
    @neighbor.destroy 

    redirect_to neighbors_path    
  end 

  private
    
    def set_neighbor
      @neighbor = Neighbor.find(params[:id])
    end

    
    def neighbor_params
      params.require(:neighbor).permit(:name, :address)
    end

end