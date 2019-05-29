class GuestUsersController < ApplicationController
  def new
    @guest_user = GuestUser.new
  end

  def create
    @guest_user = GuestUser.new(guest_user_params)
  end
end
