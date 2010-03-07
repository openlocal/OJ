class SearchController < ApplicationController
  def index
    @requests = JobRequest.search params[:query],
      :with   => {:is_open => true},
      :page   => params[:page],
      :order  => params[:order]
  end
end
