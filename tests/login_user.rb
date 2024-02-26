require 'selenium-webdriver'
require 'rspec'
require_relative '../page_objects/login_page'
require_relative '../api_objects/users'
require 'date'

# Test Data
_email = "test20240223131159@email.com"
_password = "20240223131159"

describe 'Contacts App - Login UI' do
    before(:each) do
        @driver = Selenium::WebDriver.for :firefox
        @url = 'https://thinking-tester-contact-list.herokuapp.com/'

        @driver.get(@url)
        @driver.manage.timeouts.implicit_wait = 10
    end

    after(:each) do
        @driver.quit
    end

    it 'should log in as an existing user' do
        # Create a new User
        @login_page = LoginPage.new(@driver)
        @login_page.fill_data(:EMAIL, _email)
        @login_page.fill_data(:PASSWORD, _password)
        @login_page.fill_data(:LOGIN, true)

        # TEST - Are we logged in to the new user?
        expect(@driver.current_url).to include 'contactList'
    end
end

describe 'Contacts App - Login API' do
    after(:each) do
        users_api = UsersAPI.new()
        users_api.logout(@auth_token)
    end

    it 'should log in as an existing user' do
        users_api = UsersAPI.new()
        
        response = users_api.login()

        @auth_token = response.body.match(/"token":"([^"]*)"/)[1]
        
        # TEST - Did we receive a 2xx response code?
        expect(response.code.to_i).to be_between(200, 299).inclusive

        # TEST - Did we receive an auth token?
        expect(response.body).to include '"token":'
    end
end