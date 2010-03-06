require 'machinist/active_record'
require 'faker'

JobRequest.blueprint do
  title       { "Stuff Envelopes" }
  description { "Need help preparing for a mail-out" }
  user        { User.make }
  location    { "Sydney" }
  duration    { 2 }
  status      { "Open" }
end

User.blueprint do
  email                 { Faker::Internet.email }
  password              { "password" }
  password_confirmation { "password" }
  email_confirmed       { true }
end

Category.blueprint do
  name { "construction" }
end
