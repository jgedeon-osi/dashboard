class DashboardController < SandboxBaseController
  def index
    @snapshot_url = ENV['SNAPSHOT_URL'] || ENV['INTAKE_URL'] || false
    @hotline_url = ENV['HOTLINE_URL'] || false
    @facility_url = ENV['FACILITY_URL'] || false
    @cals_url = ENV['CALS_URL'] || false

    @release_notes_url = ENV['RELEASE_NOTES_URL'] || 'https://github.com/ca-cwds/Sandbox/blob/master/Release%20Notes/release_notes.md'
    @job_aids_url = ENV['JOB_AIDS_URL'] || 'https://cwscms.osi.ca.gov/Portal/Digital-Services-Implementation-Portal/Training?folderId=1957'
  end
end
