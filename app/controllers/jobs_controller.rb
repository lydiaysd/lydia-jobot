class JobsController < ApplicationController

  def index
    @jobs = Job.all
    @user = current_user
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
