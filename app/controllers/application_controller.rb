class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :destroy_12_hours

  def destroy_12_hours
    GuestUser.all.each do |gu|
      gu.destroy if gu.created_at < Time.now - 12.hours
    end
  end
end
