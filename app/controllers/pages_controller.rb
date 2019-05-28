class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @job = Job.new
  end

  def new
    @user_skill = UserSkill.new
    @job = Job.new
  end
end
