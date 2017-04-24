class DashboardController < ApplicationController
  def index

    @intake_url = ENV['INTAKE_URL']
    @cals_url = ENV['CALS_URL']

    @release_notes_url = ENV['RELEASE_NOTES_URL'] || 'https://github.com/ca-cwds/Sandbox/blob/master/Release%20Notes/release_notes.md'
    @job_aids_url = ENV['JOB_AIDS_URL'] || 'https://cwscms.osi.ca.gov/Portal/Digital-Services-Implementation-Portal/Training?folderId=1957'
  end
end
