class JobRequestsController < ApplicationController 
  
  # GET /job_requests
  # GET /job_requests.xml
  def index
    @job_requests = JobRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @job_requests }
    end
  end

  # GET /job_requests/1
  # GET /job_requests/1.xml
  def show
    @job_request = JobRequest.find(params[:id])
    @user = current_user
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
    @user = current_user

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @job_request }
    end
  end

  # GET /job_requests/1/edit
  def edit
    @job_request = JobRequest.find(params[:id])
  end

  def step2show
    @job_request = JobRequest.find(params[:id])
    
      render 'step2'
  end

  # POST /job_requests
  # POST /job_requests.xml
  def create
    @job_request = JobRequest.new(params[:job_request])
    @job_request.status = 'pending'
    if signed_in?
      @job_request.user = current_user
    end

    respond_to do |format|
      if @job_request.save
        if signed_in?
          render :step2 and return
          
        else  
          # TODO send email
          flash[:notice] = 'JobRequest was successfully created.'
          format.html { redirect_to(@job_request) }
          format.xml  { render :xml => @job_request, :status => :created, :location => @job_request }
        end
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @job_request.errors, :status => :unprocessable_entity }
      end
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
end
