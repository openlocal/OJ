class ConfirmationsController < Clearance::ConfirmationsController
  private
  
  def url_after_create
    jobs = @user.job_requests.open
    if jobs.length == 1
      step2_job_request_path(jobs.first)
    else
      user_path(@user)
    end
  end
end
