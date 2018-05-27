OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1027365290748195
', '6c16a2e2fcaf0cfbefd5e58011a10c8c'
end
