require 'selenium-webdriver'
require 'rspec'
require_relative '../page_objects/login_page'
require_relative '../page_objects/register_page'
require_relative '../api_objects/users'
require 'date'

# Test Data
_timestamp = DateTime.now.strftime("%Y%m%d%H%M%S")
_first_name = 'Test'
_last_name = 'Testerson'
_email = "test+#{_timestamp}@email.com"
_password = _timestamp

describe 'Contacts App - Register UI' do
    before(:each) do

        @driver = Selenium::WebDriver.for :firefox
        @url = "https://thinking-tester-contact-list.herokuapp.com/login"

        @driver.get(@url)
        @driver.manage.timeouts.implicit_wait = 10
    end

    after(:each) do
        @driver.quit
    end

    it 'should register a new user' do
        # Create a new User
        @login_page = LoginPage.new(@driver)
        @login_page.fill_data(:REGISTER, true)

        @register_page = RegisterPage.new(@driver)
        @register_page.fill_data(:FIRST_NAME, _first_name)
        @register_page.fill_data(:LAST_NAME, _last_name)
        @register_page.fill_data(:EMAIL, _email)
        @register_page.fill_data(:PASSWORD, _password)
        @register_page.fill_data(:SUBMIT, true)

        # TEST - Are we logged in to the new user?
        expect(@driver.current_url).to include 'contactList'
    end
end

describe 'Contacts App - Register API' do
    after(:each) do
        users_api = UsersAPI.new()
        users_api.log_out_user(@auth_token)
    end

    it 'should register a new user' do

        # Prepare the request data (update email and password for API test)
        _email = _email.gsub(_password, _password + "_api")
        _password = _password + "_api"

        users_api = UsersAPI.new()
        response = users_api.add_user(_first_name, _last_name, _email, _password)

        @auth_token = response.body.match(/"token":"([^"]*)"/)[1]

        # TEST - Did we receive a 2xx response code?
        expect(response.code.to_i).to be_between(200, 299).inclusive

        # TEST - Did we receive an auth token?
        expect(response.body).to include '"token":'
    end
end