class FeedbacksController < ApplicationController
  def new
    @feedback = job_request.build_feedback
  end
  
  def create
    job_request.create_feedback params[:feedback]
    
    flash[:notice] = 'Feedback received. Thank you.'
    redirect_to job_request
  end
  
  private
  
  def job_request
    @job_request ||= JobRequest.find(params[:job_request_id])
  end
end
