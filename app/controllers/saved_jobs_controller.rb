class SavedJobsController < ApplicationController
  def index
    @saved_jobs = policy_scope(SavedJob)
    @user = current_user
    @saved_jobs = SavedJob.where(user: @user)
    @jobs = Job.where(user: @user)
  end

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
    @job = @saved_job.job
    @saved_job.destroy
    redirect_to job_path(@job)
  end
end
