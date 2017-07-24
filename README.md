# README
This is a little app, allows to authenticate with your Google credentials,
if successful will list your Google Contacts.

* Ruby version

  ruby-2.3.4

* System dependencies

  >bundle install

* Configuration

  Please set your env variables, needed for Omniath, authentication with
  Google credentials.

  ENV['GOOGLE_CLIENT_ID']
  >export GOOGLE_CLIENT_ID='your google id is here'

  ENV['GOOGLE_SECRET_KEY']
  >export GOOGLE_SECRET_KEY='your google secret key'

Make sure you have set your google cloud settings
  * Important to set correct redirect urls.
  * Important to enable Google Contacts API option
  * Important to enable GooGle+ API option

  >go to https://console.cloud.google.com/apis/credentials/oauthclient/

![Google Clooud Settings](/public/google_cloud_settings.png)
* How to run the test suite

  >rspec

* Deployment instructions to Heroku
  >git pull origin production

  >heroku login

  >heroku create app_name

  >git push heroku production:master


* Deployed version is available here

  [Google contacts](https://google-contacts.herokuapp.com)
