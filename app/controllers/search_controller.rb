class SearchController < ApplicationController
  def index
    @requests = JobRequest.search(
      params[:query],
      :with => {:is_pending => false},
      :page => params[:page]
    )
  end
end
