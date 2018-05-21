OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1777605335640093', '10884c8fc2578f2ff4d818aff80b1351'
end
