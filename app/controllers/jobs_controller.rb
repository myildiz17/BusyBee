class JobsController < ApplicationController

    before_action :set_job, only: [:show, :edit, :update, :destroy]

    def index
        @jobs = Job.all
    end
    
    def show

    end

    def new
        @job = Job.new
        @neighbors = Neighbor.all
        @worker_bees = WorkerBee.all
    end


    def edit
        @neighbors = Neighbor.all
        @worker_bees = WorkerBee.all
      end
    
      def create
        @job = Job.new(job_params)
    
        respond_to do |format|
          if @job.save
            format.html { redirect_to @job, notice: 'job was successfully added.' }
            format.json { render :show, status: :created, location: @job }
          else
            format.html { render :new }
            format.json { render json: @job.errors, status: :unprocessable_entity }
          end
        end
      end
    
      def update
        @job = Job.find(params[:id])
          @job.update(job_params)
          if @job.save 
              flash[:success] = "job Successfully Created!"
              redirect_to job_path(@job)
          else 
              flash[:errors] = @job.errors.full_messages
              redirect_to edit_job_path(@job)
          end 
      end
    
      def destroy
        @job = Job.find(params[:id])
        @job.destroy 
  
        redirect_to neighbor_path(@job.neighbor_id)
       
      end

private
    def job_params
        params.require(:job).permit(:neighbor_id, :worker_bee_id, :category, :total_time, :date, :time)
    end

      def set_job
        @job = Job.find(params[:id])
      end
  
end

