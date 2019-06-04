class SavedJobsController < ApplicationController
  def new
    @saved_job = SavedJob.new
  end

  def create
    @job = Job.find(params[:job_id])
    @saved_job = SavedJob.new(user: current_user)
    @saved_job.job = @job
    if @saved_job.save
      redirect_to job_path(@job)
    else
      render :show
    end
  end

  def destroy
    @saved_job = SavedJob.find(params[:id])
    @saved_job.destroy
    redirect_to job_path(@job)
  end
end
