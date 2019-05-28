class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
end
 ActionController::Base.instance_methods.include? :home
