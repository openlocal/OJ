class HomeController < ApplicationController
  def index
    @open      = JobRequest.open.limited
    @completed = JobRequest.completed.limited.recent
    @feedbacks = Feedback.recent.limited
  end
end
