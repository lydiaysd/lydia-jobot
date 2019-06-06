class JobsController < ApplicationController

  def index
    @user = current_user
    # @jobs = Job.where(
    #   job_title: current_user.job_title,
    #   location: current_user.location
    #   # total_compensation: current_user.total_compensation,
    #   # years_experience: current_user.years_experience,
    #   # education_degree: current_user.education_degree,
    #   # visa_sponsor: current_user.visa_sponsor,
    #   # date_posted: current_user.date_posted,
    #   # employment_type: current_user.employment_type
    # )
    @jobs = Job.search_by_title_and_location(current_user.job_title)
    @jobs += Job.search_by_title_and_location(current_user.location)
    @jobs = @jobs.uniq.sort_by { |j| -j.score(current_user) }

    # skills and lnaguages?
  end

  def show
    @job = Job.find(params[:id])
    @job_saved = SavedJob.find_by(user: current_user, job: @job)
    # SavedJob.find(user: current_user, job_id: @job)
    @total_compensation_binary = @job.total_compensation.to_i >= current_user.total_compensation.to_i
    @visa_binary = @job.visa_sponsor == current_user.visa_sponsor
    @years_experience_binary = @job.years_experience.to_i <= current_user.years_experience.to_i
    # @education_degree_binary =
    # @employment_type_binary =
    # @skills_binary =
    # @languages_binary =
    # @industries_binary =
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
