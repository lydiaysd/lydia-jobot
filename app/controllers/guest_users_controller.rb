class GuestUsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  EDUCATION_DEGREES = ['High School', 'Bachelor', 'Master', 'Phd', 'Any']
  EMPLOYMENT_TYPES = ['Full-time', 'Part-time', 'Internship', 'Any']
  def new
    @guest_user = GuestUser.new
  end

  def create
    @guest_user = GuestUser.new(guest_user_params)
    @guest_user.skill_ids = params[:guest_user][:skill_ids].reject(&:blank?)
    @guest_user.language_ids = params[:guest_user][:language_ids].reject(&:blank?)
    @guest_user.industry_ids = params[:guest_user][:industry_ids].reject(&:blank?)
    @guest_user.education_degree = params[:guest_user][:education_degree]
    @guest_user.employment_type = params[:guest_user][:employment_type]
    @guest_user.save
    reed_scrape(@guest_user.job_title, @guest_user.location, @guest_user.date_posted)
    session[:guest_user_id] = @guest_user.id
    redirect_to new_user_registration_path
  end

  private

  def reed_scrape(job_title, location, date_posted)
    puts "Scraping jobs from reed.co.uk"
    ReedScraper.new(job_title, location, date_posted).scrape
  end

  def guest_user_params
    params.require(:guest_user).permit(:name, :job_title, :location, :total_compensation, :years_experience, :visa_sponsor, :date_posted, :education_degree, :employment_type)
  end
end
