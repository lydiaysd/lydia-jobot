class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :welcome, :loading]

  def home
  end

  def new
  end

  def loading
  end
end
