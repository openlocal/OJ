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
  JobRequest.make :title => title, :status => "Pending"
end
