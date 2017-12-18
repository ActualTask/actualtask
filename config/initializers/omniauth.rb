
OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '803720449806-f9nms04j1loi2gou68tac15mvjceov15.apps.googleusercontent.com', '5J34syUD6cogSNSvVRYv3JNH', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end