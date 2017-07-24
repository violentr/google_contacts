class GoogleContactsService
  attr_reader :token
  attr_reader :user_email

  BASE_URL = 'https://www.google.com'

  def initialize(token, user_email)
    @token = token
    @user_email = user_email
  end

  def headers
     {'Authorization' => "Bearer #{token}",
      'GData-Version' => "3.0"}
  end

  def contacts_path
    '/m8/feeds/contacts/'+user_email.to_s+'/full?alt=json'
  end

  def authenticate
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http.get(contacts_path, headers)
  end

  def uri
    URI.parse(BASE_URL)
  end

  def get_data
    response = authenticate
    JSON.parse(response.body)
  end

  def list_accounts
    entries = get_data['feed']['entry']
    entries.each_with_object([]) do |entry, array|
      next if entry['gd$name'].blank?
      name, family_name = entry['gd$name']['gd$fullName']['$t'].split(' ')
      array << OpenStruct.new(name: name,  family_name: family_name)
    end
  end

end
