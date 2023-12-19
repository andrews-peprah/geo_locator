require 'vcr'

VCR.configure do |config|
  config.default_cassette_options = { record: :new_episodes }
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.allow_http_connections_when_no_cassette = true

  config.around_http_request do |request|
    name = "cassette_name_based_on_#{request.uri}"
    VCR.use_cassette(name, record: :new_episodes) do |cassette|
      request.proceed
    end
  end
end
