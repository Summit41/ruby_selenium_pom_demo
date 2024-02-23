require 'selenium-webdriver'
require 'rspec'
require_relative '../page_objects/login_page'
require 'date'

# Test Data
_email = "test20240222215206@email.com"
_password = 20240222215206

describe 'Contacts App - Login' do
    before(:each) do
        @driver = Selenium::WebDriver.for :firefox
        @url = "https://thinking-tester-contact-list.herokuapp.com/login"

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