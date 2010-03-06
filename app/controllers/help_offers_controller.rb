class HelpOffersController < ApplicationController
  before_filter :authenticate, :load_job_request
  
  # GET /help_offers
  # GET /help_offers.xml
  def index
    @help_offers = @job_request.help_offers

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @help_offers }
    end
  end

  # GET /help_offers/1
  # GET /help_offers/1.xml
  def show
    @help_offer = HelpOffer.find(params[:id])


    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @help_offer }
    end
  end

  # GET /help_offers/new
  # GET /help_offers/new.xml
  def new
    @help_offer = @job_request.help_offers.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @help_offer }
    end
  end

  # GET /help_offers/1/edit
  def edit
    @help_offer = HelpOffer.find(params[:id])
    if current_user == @job_request.user
      #accept the help offer
      render 'accept'
    elsif current_user == @help_offer.user
      render 'edit'
    else
      raise "user did not offer help or make job request"
    end
  end

  # POST /help_offers
  # POST /help_offers.xml
  def create
    @help_offer = @job_request.help_offers.build(params[:help_offer])
    @help_offer.user = current_user

    respond_to do |format|
      if @help_offer.save
        flash[:notice] = 'Help Offer was submitted.'
        format.html { redirect_to(job_request_url(@job_request)) }
        format.xml  { render :xml => @help_offer, :status => :created, :location => @help_offer }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @help_offer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /help_offers/1
  # PUT /help_offers/1.xml
  def update
    @help_offer = HelpOffer.find(params[:id])
    if @help_offer.user != current_user && @help_offer.job_request.user != current_user
      raise "You dont have permission to edit this help offer"
    end

    respond_to do |format|
      if @job_request.user == current_user
        #accepting offer
        @help_offer.accepted = true
        if @help_offer.update_attributes(params[:help_offer]) && @job_request.offered!
          #TODO send email to help offerer
          flash[:notice] = "Offer accepted, confirmation from #{@help_offer.user.name} required."
          format.html { redirect_to(job_request_url(@job_request)) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @help_offer.errors, :status => :unprocessable_entity }
        end
          
      else
        
        if @help_offer.update_attributes(params[:help_offer])
          flash[:notice] = 'HelpOffer was successfully updated.'
          format.html { redirect_to(job_request_url(@job_request)) }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @help_offer.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /help_offers/1
  # DELETE /help_offers/1.xml
  def destroy
    @help_offer = HelpOffer.find(params[:id])
    if @help_offer.user != current_user
      raise 'Only users that create help offers can destroy them'
    end
    
    if @job_request.accepted_offer == @help_offer
      @job_request.status = 'open'
      @job_request.save!
    end
    
    @help_offer.destroy
    flash[:notice] = "Your help offer has been removed."

    respond_to do |format|
      format.html { redirect_to(job_request_url(@job_request)) }
      format.xml  { head :ok }
    end
  end
  
  private
    def load_job_request
      @job_request = JobRequest.find(params[:job_request_id])
    end
end
