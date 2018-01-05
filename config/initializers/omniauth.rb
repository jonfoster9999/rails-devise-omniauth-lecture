Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "314325449059415", "4fe7d761c70de29cd817339400ed5969"
end
