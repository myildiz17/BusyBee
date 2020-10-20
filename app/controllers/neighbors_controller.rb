class NeighborsController < ApplicationController

  def index
    @neighbors = Neighbor.all
  end

  private
  def neighbor_params
    params.require(:neighbor).permit(:name, :address)
  end

end