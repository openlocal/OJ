require 'spec_helper'

describe JobRequest do
  describe '.create' do
    it "should create a user account for the given email address" do
      JobRequest.make :email_address => 'test@domain.com', :user => nil
      User.find_by_email('test@domain.com').should_not be_nil
    end
    
    it "should assign an existing account if there is one" do
      user = User.make :email => 'test@domain.com'
      job  = JobRequest.make :email_address => 'test@domain.com', :user => nil
      
      job.user.should == user
    end
  end
  
  describe '#open!' do
    before :each do
      @job = JobRequest.make(:status => 'pending')
      @job.open!
    end
    
    it "should set the status to open" do
      @job.status.should == 'open'
    end
    
    it "should save the changes" do
      @job.should_not be_changed
    end
  end
  
  describe '#category_string' do
    it "should return all the categories joined with commas" do
      @job = JobRequest.make
      @job.categories << Category.make(:name => 'foo')
      @job.categories << Category.make(:name => 'bar')
      
      @job.category_string.should == 'foo, bar'
    end
  end
  
  describe '#category_string=' do
    it "should split strings by commas" do
      @job = JobRequest.make
      @job.category_string = 'foo, bar'
      
      @job.categories.collect { |cat| cat.name }.should == ['foo', 'bar']
    end
    
    it "should create categories if they don't already exist" do
      Category.find_by_name('foo').should be_nil
      
      @job = JobRequest.make
      @job.category_string = 'foo, bar'
      
      Category.find_by_name('foo').should_not be_nil
    end
    
    it "should use existing categories if they're already there" do
      Category.make :name => 'foo'
      
      @job = JobRequest.make
      @job.category_string = 'foo, bar'
      
      Category.find_all_by_name('foo').length.should == 1
    end
  end
  
  describe '#pending' do
    it "should default to pending" do
      job = JobRequest.make_unsaved(:pending, :status => nil)
      job.save
      
      job.status.should == 'pending'
    end
    
    it "should be set to open if the user is confirmed" do
      job = JobRequest.make_unsaved(:status => nil)
      job.save
      
      job.status.should == 'open'
    end
  end
end
