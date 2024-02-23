require 'selenium-webdriver'
require 'rspec'
require_relative './page_objects/login_page'
require_relative './page_objects/register_page'
require_relative './page_objects/home_page'
require_relative './page_objects/add_contact_page'
require 'date'

# Test Data
_timestamp = DateTime.now.strftime("%Y%m%d%H%M%S")
_first_name = 'Test'
_last_name = 'Testerson'
_email = "test#{_timestamp}@email.com"
_password = _timestamp

_dob = DateTime.now.strftime("%Y-%m-%d")
_phone = DateTime.now.strftime("%Y%m%d%S")
_address_1 = DateTime.now.strftime("%H%M Test St")
_address_2 = DateTime.now.strftime("Apt #%S")
_city = 'Dallas'
_state = 'Texas'
_zip = '75204'
_country = 'United States of America'

@driver = Selenium::WebDriver.for :firefox
@url = "https://thinking-tester-contact-list.herokuapp.com/login"

@driver.get(@url)
@driver.manage.timeouts.implicit_wait = 30

@wait = wait = Selenium::WebDriver::Wait.new(:timeout => 7)

@login_page = LoginPage.new(@driver)
@login_page.fill_data(:REGISTER, true)

@register_page = RegisterPage.new(@driver)
@register_page.fill_data(:FIRST_NAME, _first_name)
@register_page.fill_data(:LAST_NAME, _last_name)
@register_page.fill_data(:EMAIL, _email)
@register_page.fill_data(:PASSWORD, _password)
@register_page.fill_data(:SUBMIT, true)

puts("#{_email} : #{_password}")

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



