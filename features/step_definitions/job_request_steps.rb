Given /^a job request "([^\"]*)"$/ do |title|
  JobRequest.make :title => title
end

Given /^a job request "([^\"]*)" with the "([^\"]*)" category$/ do |title, category|
  job = JobRequest.make :title => title
  category = Category.make :name => category
  job.categories << category
  job.save
end

Given /^a job request "([^\"]*)" described as "([^\"]*)"$/ do |title, description|
  JobRequest.make :title => title, :description => description
end

Given /^a job request "([^\"]*)" in "([^\"]*)"$/ do |title, location|
  JobRequest.make :title => title, :location => location
end

Given /^a pending job "([^\"]*)"$/ do |title|
  JobRequest.make :pending, :title => title
end

Given /^a pending job "([^\"]*)" by "([^\"]*)"$/ do |title, email_address|
  JobRequest.make :pending, :title => title, :email_address => email_address
end

Given /^a job "([^\"]*)" by "([^\"]*)" with an accepted offer$/ do |title, email|
  job = JobRequest.make :email_address => email, :title => title, :user => nil
  job.help_offers.make :accepted => true
  job.accepted!
end
