Given /^a clean slate$/ do
  Object.subclasses_of(ActiveRecord::Base).each do |model|
    next unless model.table_exists?
    model.connection.execute "TRUNCATE TABLE `#{model.table_name}`"
  end
end

Given /^the (\w+) indexes are processed$/ do |model|
  model = model.titleize.gsub(/\s/, '').constantize
  ThinkingSphinx::Test.index *model.sphinx_index_names
end

When /^I search for "([^\"]*)"$/ do |query|
  When "I go to the home page"
  And "I fill in \"Search\" with \"#{query}\""
  And "I press \"Search\""
end

Then /^I should have (\d+) emails? from Two Bob's Worth$/ do |count|
  ActionMailer::Base.deliveries.length == count.to_i
end
