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
    end
  
    def create
      @neighbor = Neighbor.new(neighbor_params)
  
      respond_to do |format|
        if @neighbor.save
          format.html { redirect_to @neighbor, notice: 'Neighbor was successfully created.' }
          format.json { render :show, status: :created, location: @neighbor }
        else
          format.html { render :new }
          format.json { render json: @neighbor.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if @neighbor.update(neighbor_params)
          format.html { redirect_to @neighbor, notice: 'Neighbor was successfully updated.' }
          format.json { render :show, status: :ok, location: @neighbor }
        else
          format.html { render :edit }
          format.json { render json: @neighbor.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @neighbor.destroy
      respond_to do |format|
        format.html { redirect_to neighbors_url, notice: 'Neighbor was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      def set_neighbor
        @neighbor = Neighbor.find(params[:id])
      end
  
     def neighbor_params
        params.require(:neighbor).permit(:name, :age)
      end
  end