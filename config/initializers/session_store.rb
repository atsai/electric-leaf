# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_electric-leaf_session',
  :secret      => 'db1a99a907a196bd81ca1e58fc8d6a1c69af912841692bd12f55b4c1b2b02605b4f69ec923127e83bec2573b8d215a023f8920bfd4aea1307e4c3e58b9531fd0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
