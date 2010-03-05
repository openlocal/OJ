# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_oj_session',
  :secret      => '348bbe3848d629c78460a70919bf2eae29a6bda8dc2f25f7d6ed906cb6d5bcb62ef84292bdae56a64d0593275c428ed75d807fdd04baf184ed74fbe8d2b3bbe1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
