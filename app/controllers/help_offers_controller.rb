class HelpOffersController < ApplicationController
  # GET /help_offers
  # GET /help_offers.xml
  def index
    @help_offers = HelpOffer.all

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
    @help_offer = HelpOffer.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @help_offer }
    end
  end

  # GET /help_offers/1/edit
  def edit
    @help_offer = HelpOffer.find(params[:id])
  end

  # POST /help_offers
  # POST /help_offers.xml
  def create
    @help_offer = HelpOffer.new(params[:help_offer])

    respond_to do |format|
      if @help_offer.save
        flash[:notice] = 'HelpOffer was successfully created.'
        format.html { redirect_to(@help_offer) }
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

    respond_to do |format|
      if @help_offer.update_attributes(params[:help_offer])
        flash[:notice] = 'HelpOffer was successfully updated.'
        format.html { redirect_to(@help_offer) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @help_offer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /help_offers/1
  # DELETE /help_offers/1.xml
  def destroy
    @help_offer = HelpOffer.find(params[:id])
    @help_offer.destroy

    respond_to do |format|
      format.html { redirect_to(help_offers_url) }
      format.xml  { head :ok }
    end
  end
end
