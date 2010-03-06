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
