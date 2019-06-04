class JobsController < ApplicationController

  def index
    @jobs = Job.where(
      job_title: current_user.job_title,
      location: current_user.location,
      # total_compensation: current_user.total_compensation,
      # years_experience: current_user.years_experience,
      # education_degree: current_user.education_degree,
      # visa_sponsor: current_user.visa_sponsor,
      # date_posted: current_user.date_posted,
      # employment_type: current_user.employment_type
    )

    # skills and lnaguages?

  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
  end

  def edit

  end

  def update

  end

  def destroy
  end

end
