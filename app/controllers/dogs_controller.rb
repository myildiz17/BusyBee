class DogsController < ApplicationController
    before_action :set_dog, only: [:show, :edit, :update, :destroy]
  
  
    def index
      @dogs = Dog.all
      sesion[:dog] || = []
      session[:dog] << params[:neighbor_id]
      redirect_to neighbors_path
    end
  
    
    def show
    end
  
    def new
      @dog = Dog.new
    end
  
   
    def edit
    end
  
    def create
      @dog = Dog.new(dog_params)
  
      respond_to do |format|
        if @dog.save
          format.html { redirect_to @dog, notice: 'Dog was successfully added.' }
          format.json { render :show, status: :created, location: @dog }
        else
          format.html { render :new }
          format.json { render json: @dog.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if @dog.update(dog_params)
          format.html { redirect_to @dog, notice: 'Dog was successfully updated.' }
          format.json { render :show, status: :ok, location: @dog }
        else
          format.html { render :edit }
          format.json { render json: @dog.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @dog.destroy
      respond_to do |format|
        format.html { redirect_to jobs_url, notice: 'Dog was successfully removed.' }
        format.json { head :no_content }
      end
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_dog
        @dog = Dog.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def dog_params
        params.require(:dog).permit(:name, :breed, :age)
      end

  end
  