OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'k9boEuIJ1Z6ua8O9DYmXRA', 'PM4Eyun0ApD7Y5vQc9RjCOxjCF8WUTOnaek2jGDJDA'
end