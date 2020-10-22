class DogsController < ApplicationController
    before_action :set_dog, only: [:show, :edit, :update, :destroy]
  
  
    def index
      @dogs = Dog.all
    end
   
    
    def show
      
      @neighbor = Neighbor.find(params[:neighbor_id])
    end
  
    def new
      
      @neighbor = Neighbor.find(params[:neighbor_id])
      @dog = @neighbor.dogs.new
      
    end
  
   
    def edit
      # @neighbors = Neighbor.all
      @neighbor = Neighbor.find(params[:neighbor_id])
      @dog = Dog.find(params[:id])
      
    end
  
    def create
      @neighbor = Neighbor.find(params[:neighbor_id])
      @dog = @neighbor.dogs.create(dog_params)
      
  
      respond_to do |format|
        if @dog.save
          format.html { redirect_to neighbor_dog_path(@neighbor, @dog), notice: 'Dog was successfully added.' }
          format.json { render :show, status: :created, location: @dog }
        else
          format.html { render :new }
          format.json { render json: @dog.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      @dog = Dog.find(params[:id])
      @dog.update(dog_params)
    
        if @dog.save 
            flash[:success] = "dog Successfully Created!"
            redirect_to neighbor_dog_path(@dog.neighbor, @dog)
        else 
            flash[:errors] = @dog.errors.full_messages
            redirect_to edit_neighbor_dog_path(@dog.neighbor, @dog)
        end 
    end
  
    def destroy
      @dog = Dog.find(params[:id])
      @dog.destroy 

      redirect_to neighbor_path(@dog.neighbor_id)
     
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_dog
        @dog = Dog.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def dog_params
        params.require(:dog).permit(:name, :breed, :age, :neighbor_id)
      end

  end
  
  