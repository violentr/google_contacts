class SessionsController < ApplicationController
  def create
    token = request.env['omniauth.auth']['credentials']['token']
    user_email = request.env['omniauth.auth'].info.email
    uri = URI.parse('https://www.google.com')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    path = '/m8/feeds/contacts/'+user_email.to_s+'/full?alt=json'

    headers = {'Authorization' => "Bearer #{token}",
                 'GData-Version' => "3.0"}
    response = http.get(path, headers)
    data = JSON.parse(response.body)
    render html: data
  end
end
