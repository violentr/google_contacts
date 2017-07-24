class SessionsController < ApplicationController
  def create
    return {} unless request.env['omniauth.auth']
    token = request.env['omniauth.auth']['credentials']['token']
    user_email = request.env['omniauth.auth'].info.email
    contacts = ::GoogleContactsService.new(token, user_email)
    @data = contacts.list_accounts
  end
end
