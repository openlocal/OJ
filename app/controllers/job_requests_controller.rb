class JobRequestsController < ApplicationController 
  before_filter :validate_user, :only => [:update, :destroy, :cancel_accept]
  # GET /job_requests
  # GET /job_requests.xml
  def index
    redirect_to '/search'
  end

  # GET /job_requests/1
  # GET /job_requests/1.xml
  def show
    @job_request = JobRequest.find(params[:id])
    @help_offers = HelpOffer.paginate_by_job_request_id @job_request.id, :page => 1, :order => 'created_at DESC'
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @job_request }
    end
  end

  # GET /job_requests/new
  # GET /job_requests/new.xml
  def new
    @job_request = JobRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job_request }
    end
  end

  # GET /job_requests/1/edit
  def edit
    @job_request = JobRequest.find(params[:id])
  end

  def step2
    @job_request = JobRequest.find(params[:id])
    
    render 'step2'
  end

  # POST /job_requests
  # POST /job_requests.xml
  def create
    @job_request = JobRequest.new(params[:job_request])
    @job_request.user = current_user if signed_in?

    if @job_request.save
      if signed_in?
        render :step2 and return
      elsif @job_request.user.email_confirmed?
        flash[:notice] = 'Please log in to confirm your request.'
        session[:return_to] = step2_job_request_path(@job_request)
        redirect_to new_session_path
      else
        flash[:notice] = 'Please check your email and confirm your account to make your request public.'
        redirect_to @job_request
      end
    else
      render :action => "new"
    end
  end

  # PUT /job_requests/1
  # PUT /job_requests/1.xml
  def update
    @job_request = JobRequest.find(params[:id])
    
    if params[:time_period] 
      @job_request.start_at = Date.today
      @job_request.end_at = case params[:time_period]
      when 'today'
        Date.today
      when 'next-days'
        3.day.from_now 
      when 'this-week'
        1.week.from_now
      when 'this-month'
        1.month.from_now
      end
      if @job_request.status == 'pending'
        @job_request.status = 'open'
      end
    end
    
    respond_to do |format|
      if @job_request.update_attributes(params[:job_request])
        flash[:notice] = 'JobRequest was successfully updated.'
        format.html { redirect_to(@job_request) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @job_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /job_requests/1
  # DELETE /job_requests/1.xml
  def destroy
    @job_request = JobRequest.find(params[:id])
    @job_request.destroy

    respond_to do |format|
      format.html { redirect_to(job_requests_url) }
      format.xml  { head :ok }
    end
  end
  
  def accept
     @job_request = JobRequest.find(params[:id])
     if @job_request.status != "offered"
      raise "status is not offerd"
     end
     if current_user != @job_request.accepted_offer.user
       raise "user is not owner of obj"
     end
     @job_request.status = "accepted"
     @job_request.save!
     redirect_to(@job_request)
  end
  
  def cancel_accept
    @job_request = JobRequest.find(params[:id])
    redirect_to(@job_request) unless @job_request.accepted_offer
    offer = @job_request.accepted_offer
    offer.accepted = false
    offer.save!
    @job_request.status = 'open'
    @job_request.save!
    flash[:notice] = 'Reversed offer acceptance.'
    redirect_to(@job_request)
  end
  
  private
  def validate_user
    @job_request = JobRequest.find(params[:id])
    if @job_request.user != current_user
      raise 'this user is not allowed to perform this operation.'
    end
  end
  
end
