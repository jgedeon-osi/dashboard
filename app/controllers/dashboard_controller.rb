class DashboardController < ApplicationController
  def index

    @intake_url = ENV['INTAKE_URL']
    @cals_url = ENV['CALS_URL']
  end
end
