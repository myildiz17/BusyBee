class JobsController < ApplicationController

    def index
        @jobs = Job.all
    end
    
private
    def jobs_params
        params.require(:job).permit(:neighbor_id, :worker_bee_id, :category, :total_time, :date, :time)
    end


end