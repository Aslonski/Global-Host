class ApplicationController < ActionController::Base
  include SessionsHelper
  include MapsHelper
  protect_from_forgery with: :exception
  helper_method :current_user

end
