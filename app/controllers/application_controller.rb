class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.new(session[:user].symbolize_keys) if session[:user]
  end
end
