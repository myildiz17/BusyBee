class ChildrenController < ApplicationController
    before_action :set_child, only: [:show, :edit, :update, :destroy]
  
  
    def index
      @children = Child.all
    end
  
    
    def show
      @neighbor = Neighbor.find(params[:neighbor_id])
    end
  

    def new
      
      @neighbor = Neighbor.find(params[:neighbor_id])
      @child = @neighbor.children.new
    end
  
   
    def edit
      @neighbor = Neighbor.find(params[:neighbor_id])
      @child = Child.find(params[:id])
    end
  
    def create
      @neighbor = Neighbor.find(params[:neighbor_id])
      @child = @neighbor.children.create(child_params)
      

        if @child.save 
            redirect_to neighbor_child_path(@neighbor, @child)
        else
            flash[:errors]= @child.errors.full_messages
            redirect_to new_child_path(@child)
        end
    end
  
    def update
      @child = Child.find(params[:id])
        @child.update(child_params)
        if @child.save 
            flash[:success] = "child Successfully Created!"
            redirect_to neighbor_child_path(@child.neighbor, @child)
        else 
            flash[:errors] = @child.errors.full_messages
            redirect_to edit_neighbor_child_path(@child.neighbor, @child)
        end 
    end
  
    def destroy
    @child = Child.find(params[:id])
    @child.destroy 

    redirect_to neighbor_path(@child.neighbor_id)
    # redirect_to snails_path  
    end
  
    private
     def set_child
        @child = Child.find(params[:id])
      end
  
      def child_params
        params.require(:child).permit(:name, :age, :neighbor_id)
      end
  
  end
  
  