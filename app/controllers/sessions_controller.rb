class SessionsController < ApplicationController
  def create


    auth_data = request.env['omniauth.auth']
    session_data = {
      username: auth_data.dig('info', 'nickname'),
      auth_token: auth_data.dig('credentials', 'token'),
      repos_url: auth_data.dig('extra', 'raw_info', 'repos_url')
    }

    session[:user] = session_data

    redirect_to dashboard_path
  end

  def destroy
    session[:user] = nil

    redirect_to '/'
  end
end
