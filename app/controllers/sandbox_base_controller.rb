class SandboxBaseController < ApplicationController
  before_action :authenticate_with_cwds

  protected

  def authenticate_with_cwds
    token = params[:token]

    # If passed a new token, delete the one from the session
    session.delete(:token) if token
    # If no new token and current token exists, continue as normal
    return if session[:token]

    if Cwds::Authentication.token_validation(token, ENV['AUTHENTICATION_API_BASE_URL'])
      session[:token] = params[:token]
      params.delete(:token)
      redirect_to request.path
    else
      redirect_to Cwds::Authentication.authentication_url(ENV['AUTHENTICATION_API_BASE_URL'], request.url)
    end
  end

end

