Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_SECRET_KEY'],
          {
      scope: 'email, profile, plus.me, contacts',
      prompt: 'select_account',
      image_aspect_ratio: 'square',
      image_size: 50
        }
end
