require 'machinist/active_record'
require 'faker'

JobRequest.blueprint do
  title       { "Stuff Envelopes" }
  description { "Need help preparing for a mail-out" }
  user        { User.make }
  location    { "Sydney" }
  duration    { 2 }
  status      { "open" }
end

JobRequest.blueprint(:pending) do
  user          { nil }
  email_address { Faker::Internet.email }
  status        { "pending" }
end

HelpOffer.blueprint do
  user        {User.make}
  job_request {JobRequest.make}  
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

Feedback.blueprint do
  job_request { JobRequest.make }
  help_offer  { HelpOffer.make :job_request => job_request }
  rating      { 3 }
  duration    { 4 }
  notes       { "Great job." }
end
