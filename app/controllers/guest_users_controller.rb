class GuestUsersController < ApplicationController
  before_action :education_degrees
  skip_before_action :authenticate_user!, only: [:new, :create]

  def new
    @guest_user = GuestUser.new
  end

  def create
    @guest_user = GuestUser.create(guest_user_params)
    session[:guest_user_id] = @guest_user.id
    redirect_to new_user_registration_path
  end

  private

  def education_degrees
    @education_degrees = ['High School Diploma', 'Master of Arts (M.A.)', 'Master of Science (M.S.)', 'Master of Business Administration (MBA)', 'Master of Fine Arts (MFA)', 'Bachelor of Arts (B.A.)', 'Bachelor of Science (B.S.)', 'Bachelor of Fine Arts (BFA)', 'Bachelor of Applied Science (BAS)', 'Associate of Arts (A.A.)', 'Associate of Science (A.S.)', 'Associate of Applied Science (AAS)', 'Doctor of Philosophy (Ph.D.)', 'Juris Doctor (J.D.)', 'Doctor of Medicine (M.D.)', 'Doctor of Dental Surgery (DDS)]']
  end

  def guest_user_params
    params.require(:guest_user).permit(:name, :job_title, :location, :total_compensation, :years_experience, :visa_sponsor, :education_degree, :employment_type, :date_posted)
  end
end
