class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    @user = User.update(set_params)
    redirect_to jobs_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def set_params
    params.require(:user).permit(
      :name, :job_title, :location, :total_compensation,
      :years_experience, :education_degree, :visa_sponsor,
      :date_posted, :employment_type
    )
  end
end
