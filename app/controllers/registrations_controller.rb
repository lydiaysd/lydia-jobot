class RegistrationsController < Devise::RegistrationsController
  after_action :merge_users, only: [:create, :new]

  def merge_users
    @guest_user = GuestUser.find(session[:guest_user_id])
    @user = current_user
    @user.update(
      name: @guest_user.name,
      job_title: @guest_user.job_title,
      location: @guest_user.location,
      total_compensation: @guest_user.total_compensation,
      years_experience: @guest_user.years_experience,
      education_degree: @guest_user.education_degree,
      visa_sponsor: @guest_user.visa_sponsor,
      date_posted: @guest_user.date_posted,
      employment_type: @guest_user.employment_type
    )
    @guest_user.destroy
  end

  protected

  def after_sign_up_path_for(resource)
    jobs_path
  end
end
