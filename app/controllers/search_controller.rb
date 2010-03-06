class SearchController < ApplicationController
  def index
    @requests = JobRequest.search params[:query]
  end
end