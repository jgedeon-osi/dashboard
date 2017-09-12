class SandboxBaseController < ApplicationController
  before_action :authenticate_with_cwds

  protected

  def authenticate_with_cwds

    puts "beofre - session token #{session[:token]}"

    if params[:token]
      puts "params token #{params[:token]}"
      # If passed a new token, delete the one from the session
      new_token = params[:token]
      session.delete(:token)
    end

    puts "after - session token #{session[:token]}"
    # If no new token and current token exists, continue as normal
    return if session[:token]

    if Cwds::Authentication.token_validation(new_token, ENV['AUTHENTICATION_API_BASE_URL'])
      puts "token validated success #{new_token}"
      session[:token] = new_token

      puts "will redirect to - #{url_for(request.params.except(:token))}"
      # redirect to request URL without token in querystring
      redirect_to url_for(request.params.except(:token))
    else
      puts "toekn invalid - redirect to perry"
      redirect_to Cwds::Authentication.authentication_url(ENV['AUTHENTICATION_API_BASE_URL'], request.url)
    end
  end

end
