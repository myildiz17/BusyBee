class JobsController < ApplicationController

    before_action :set_job, only: [:show, :edit, :update, :destroy]

    def index
        @jobs = Job.all
    end
    
    def show

    end

private
    def jobs_params
        params.require(:job).permit(:neighbor_id, :worker_bee_id, :category, :total_time, :date, :time)
    end

      def set_job
        @job = Job.find(params[:id])
      end
  
end

