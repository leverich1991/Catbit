Rails.application.config.middleware.use OmniAuth::Builder do
  provider :fitbit, '112ab647273543b89fc58ad1e4932be1', '0d31c388f89e4b50bd878002ac354a4a'
end
