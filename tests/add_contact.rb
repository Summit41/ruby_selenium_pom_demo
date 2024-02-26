require 'selenium-webdriver'
require 'rspec'
require_relative '../page_objects/login_page'
require_relative '../page_objects/register_page'
require_relative '../page_objects/home_page'
require_relative '../page_objects/add_contact_page'
require_relative '../api_objects/users'
require_relative '../api_objects/contacts'
require 'date'

# Test Data
_first_name = 'Test'
_last_name = 'Testerson'
_email = "test@email.com"
_dob = DateTime.now.strftime("%Y-%m-%d")
_phone = DateTime.now.strftime("%Y%m%d%S")
_address_1 = DateTime.now.strftime("%H%M Test St")
_address_2 = DateTime.now.strftime("Apt #%S")
_city = 'Dallas'
_state = 'Texas'
_zip = '75204'
_country = 'United States of America'

describe 'Contacts App - Add Contact UI' do
    before(:each) do

        @driver = Selenium::WebDriver.for :firefox
        @url = "https://thinking-tester-contact-list.herokuapp.com/login"

        @driver.get(@url)
        @driver.manage.timeouts.implicit_wait = 10

        @login_page = LoginPage.new(@driver)
        @login_page.login
    end

    after(:each) do
        @driver.quit
    end

    it 'should add a new contact via ui' do
        # Add a new contact
        @home_page = HomePage.new(@driver)
        @home_page.fill_data(:ADD_CONTACT, true)
        
        @add_contact_page = AddContactPage.new(@driver)
        @add_contact_page.fill_data(:FIRST_NAME, _first_name)
        @add_contact_page.fill_data(:LAST_NAME, _last_name)
        @add_contact_page.fill_data(:DATE_OF_BIRTH, _dob)
        @add_contact_page.fill_data(:EMAIL, _email)
        @add_contact_page.fill_data(:PHONE, _phone)
        @add_contact_page.fill_data(:STREET_ADDRESS_1, _address_1)
        @add_contact_page.fill_data(:STREET_ADDRESS_2, _address_2)
        @add_contact_page.fill_data(:CITY, _city)
        @add_contact_page.fill_data(:STATE_OR_PROVINCE, _state)
        @add_contact_page.fill_data(:POSTAL_CODE, _zip)
        @add_contact_page.fill_data(:COUNTRY, _country)
        
        @add_contact_page.fill_data(:SUBMIT, true)

        contact_link = @home_page.find_contact(_email)

        # TEST - Did we find the new contact?
        expect(contact_link).not_to be_nil
    end
end

describe 'Contacts App - Add Contact API' do
    before(:each) do
        users_api = UsersAPI.new()
        
        response = users_api.log_in_user()
        @auth_token = response.body.match(/"token":"([^"]*)"/)[1]
    end

    after(:each) do
        users_api = UsersAPI.new()
        users_api.log_out_user(@auth_token)
    end

    it 'should add a new contact via api'  do
        contacts_api = ContactsAPI.new()

        response = contacts_api.add_contact(@auth_token, _first_name, _last_name, _dob, _email,
                _phone, _address_1, _address_2, _city, _state, _zip, _country)

        # TEST - Did we receive a 2xx response code?
        expect(response.code.to_i).to be_between(200, 299).inclusive

        # TEST - Did we receive a contact id?
        expect(response.body).to include '"_id":'
    end
end