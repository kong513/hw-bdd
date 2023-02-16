# config/initializers/omniauth.rb

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook,'1395172054579523', '993cda415b75021f475887b59021f118'
end
