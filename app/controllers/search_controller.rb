class SearchController < ApplicationController
  def index
    @requests = JobRequest.search(
      params[:query],
      :with => {:is_pending => false}
    )
  end
end