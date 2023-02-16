# config/initializers/omniauth.rb

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['1395172054579523'], ENV['993cda415b75021f475887b59021f118'],
    scope: 'email,user_birthday', display: 'popup', provider_ignores_state: true
end
