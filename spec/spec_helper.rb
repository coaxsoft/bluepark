require 'bundler/setup'
require 'bluepark'
require 'vcr'
require 'webmock/rspec'

Bundler.setup

VCR.configure do |c|
  c.hook_into :webmock
  c.cassette_library_dir = 'spec/support/cassettes'
  c.configure_rspec_metadata!
  c.default_cassette_options = { record: :new_episodes }
  allow_http_connections_when_no_cassette = true
end

RSpec.configure do |config|

end
