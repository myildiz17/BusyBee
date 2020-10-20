class ChildrenController < ApplicationController
    before_action :set_child, only: [:show, :edit, :update, :destroy]
  
  
    def index
      @children = Child.all
    end
  
    
    def show
    end
  
    def new
      @child = Child.new
    end
  
   
    def edit
    end
  
    def create
      @child = Child.new(job_params)
  
      respond_to do |format|
        if @child.save
          format.html { redirect_to @child, notice: 'Child was successfully added.' }
          format.json { render :show, status: :created, location: @child }
        else
          format.html { render :new }
          format.json { render json: @child.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if @child.update(job_params)
          format.html { redirect_to @child, notice: 'Child was successfully updated.' }
          format.json { render :show, status: :ok, location: @child }
        else
          format.html { render :edit }
          format.json { render json: @child.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @child.destroy
      respond_to do |format|
        format.html { redirect_to jobs_url, notice: 'Child was successfully reomved.' }
        format.json { head :no_content }
      end
    end
  
    private
     def set_child
        @child = Child.find(params[:id])
      end
  
      def child_params
        params.require(:child).permit(:name, :age)
      end
  end
  end
  