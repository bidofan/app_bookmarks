OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['1027365290748195'], ENV['6c16a2e2fcaf0cfbefd5e58011a10c8c'], display: 'popup'
end
