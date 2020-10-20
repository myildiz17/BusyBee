class BeesController < ApplicationController
    before_action :set_bee, only: [:show, :edit, :update, :destroy]
  
    def index
      @worker_bees = WorkerBee.all
    end
  
    def show
    end
  
    def new
      @worker_bee = WorkerBee.new
    end
  
    def edit
    end
  
    def create
      @worker_bee = WorkerBee.new(bee_params)
  
      respond_to do |format|
        if @worker_bee.save
          format.html { redirect_to @worker_bee, notice: 'Worker Bee was successfully created.' }
          format.json { render :show, status: :created, location: @worker_bee }
        else
          format.html { render :new }
          format.json { render json: @worker_bee.errors, status: :unprocessable_entity }
        end
      end
    end
  
  
    def update
      respond_to do |format|
        if @worker_bee.update(bee_params)
          format.html { redirect_to @worker_bee, notice: 'Worker Bee was successfully updated.' }
          format.json { render :show, status: :ok, location: @worker_bee }
        else
          format.html { render :edit }
          format.json { render json: @worker_bee.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @worker_bee.destroy
      respond_to do |format|
        format.html { redirect_to bees_url, notice: 'Worker Bee was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  
    private
      
      def set_bee
        @worker_bee = WorkerBee.find(params[:id])
      end
  
      
      def bee_params
        params.require(:worker_bee).permit(:name, :price_per_hour)
      end
  end