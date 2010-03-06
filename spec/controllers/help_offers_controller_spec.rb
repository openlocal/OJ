require 'spec_helper'

describe HelpOffersController do

  def mock_help_offer(stubs={})
    @mock_help_offer ||= mock_model(HelpOffer, stubs)
  end

  describe "GET index" do
    it "assigns all help_offers as @help_offers" do
      HelpOffer.stub!(:find).with(:all).and_return([mock_help_offer])
      get :index
      assigns[:help_offers].should == [mock_help_offer]
    end
  end

  describe "GET show" do
    it "assigns the requested help_offer as @help_offer" do
      HelpOffer.stub!(:find).with("37").and_return(mock_help_offer)
      get :show, :id => "37"
      assigns[:help_offer].should equal(mock_help_offer)
    end
  end

  describe "GET new" do
    it "assigns a new help_offer as @help_offer" do
      HelpOffer.stub!(:new).and_return(mock_help_offer)
      get :new
      assigns[:help_offer].should equal(mock_help_offer)
    end
  end

  describe "GET edit" do
    it "assigns the requested help_offer as @help_offer" do
      HelpOffer.stub!(:find).with("37").and_return(mock_help_offer)
      get :edit, :id => "37"
      assigns[:help_offer].should equal(mock_help_offer)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created help_offer as @help_offer" do
        HelpOffer.stub!(:new).with({'these' => 'params'}).and_return(mock_help_offer(:save => true))
        post :create, :help_offer => {:these => 'params'}
        assigns[:help_offer].should equal(mock_help_offer)
      end

      it "redirects to the created help_offer" do
        HelpOffer.stub!(:new).and_return(mock_help_offer(:save => true))
        post :create, :help_offer => {}
        response.should redirect_to(help_offer_url(mock_help_offer))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved help_offer as @help_offer" do
        HelpOffer.stub!(:new).with({'these' => 'params'}).and_return(mock_help_offer(:save => false))
        post :create, :help_offer => {:these => 'params'}
        assigns[:help_offer].should equal(mock_help_offer)
      end

      it "re-renders the 'new' template" do
        HelpOffer.stub!(:new).and_return(mock_help_offer(:save => false))
        post :create, :help_offer => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested help_offer" do
        HelpOffer.should_receive(:find).with("37").and_return(mock_help_offer)
        mock_help_offer.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :help_offer => {:these => 'params'}
      end

      it "assigns the requested help_offer as @help_offer" do
        HelpOffer.stub!(:find).and_return(mock_help_offer(:update_attributes => true))
        put :update, :id => "1"
        assigns[:help_offer].should equal(mock_help_offer)
      end

      it "redirects to the help_offer" do
        HelpOffer.stub!(:find).and_return(mock_help_offer(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(help_offer_url(mock_help_offer))
      end
    end

    describe "with invalid params" do
      it "updates the requested help_offer" do
        HelpOffer.should_receive(:find).with("37").and_return(mock_help_offer)
        mock_help_offer.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :help_offer => {:these => 'params'}
      end

      it "assigns the help_offer as @help_offer" do
        HelpOffer.stub!(:find).and_return(mock_help_offer(:update_attributes => false))
        put :update, :id => "1"
        assigns[:help_offer].should equal(mock_help_offer)
      end

      it "re-renders the 'edit' template" do
        HelpOffer.stub!(:find).and_return(mock_help_offer(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested help_offer" do
      HelpOffer.should_receive(:find).with("37").and_return(mock_help_offer)
      mock_help_offer.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the help_offers list" do
      HelpOffer.stub!(:find).and_return(mock_help_offer(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(help_offers_url)
    end
  end

end
