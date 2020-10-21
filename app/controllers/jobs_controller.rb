class JobsController < ApplicationController

    def index
        @jobs = Job.all
        session[:dog] || session[:dog] = []
        @dog_jobs = Job.find(session[:dog])
    end
    
private
    def jobs_params
        params.require(:job).permit(:neighbor_id, :worker_bee_id, :category, :total_time, :date, :time)
    end


end