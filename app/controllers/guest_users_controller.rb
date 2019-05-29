class GuestUsersController < ApplicationController
  before_action :education_degrees
  def new
    @guest_user = GuestUser.new
  end

  def create
    @guest_user = GuestUser.new(guest_user_params)
  end

  private

  def education_degrees
    @education_degrees = ['High School Diploma', 'Master of Arts (M.A.)', 'Master of Science (M.S.)', 'Master of Business Administration (MBA)', 'Master of Fine Arts (MFA)', 'Bachelor of Arts (B.A.)', 'Bachelor of Science (B.S.)', 'Bachelor of Fine Arts (BFA)', 'Bachelor of Applied Science (BAS)', 'Associate of Arts (A.A.)', 'Associate of Science (A.S.)', 'Associate of Applied Science (AAS)', 'Doctor of Philosophy (Ph.D.)', 'Juris Doctor (J.D.)', 'Doctor of Medicine (M.D.)', 'Doctor of Dental Surgery (DDS)]']
  end
end
