class SandboxBaseController < ApplicationController

  before_action :authenticate_with_cwds

  token = ''


  protected

  def authenticate_with_cwds
    if session[:token].blank?
      if Cwds::Authentication.token_validation(params[:token], ENV['AUTHENTICATION_API_BASE_URL'])
        session[:token] = params[:token]

      else
        puts 'querystring token not present or failed token validation'
        redirect_to Cwds::Authentication.authentication_url(ENV['AUTHENTICATION_API_BASE_URL'], request.url)
      end
    end


  end

end
