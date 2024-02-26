require_relative '../api_objects/users'
require_relative '../api_objects/contacts'

# ADD USER
_timestamp = DateTime.now.strftime("%Y%m%d%H%M%S")
_first_name = 'Test'
_last_name = 'Testerson'
_email = "test+#{_timestamp}@email.com"
_password = _timestamp

_contact_email = "test@email.com"
_dob = DateTime.now.strftime("%Y-%m-%d")
_phone = DateTime.now.strftime("%Y%m%d%S")
_address_1 = DateTime.now.strftime("%H%M Test St")
_address_2 = DateTime.now.strftime("Apt #%S")
_city = 'Dallas'
_state = 'Texas'
_zip = '75204'
_country = 'United States of America'

users_api = UsersAPI.new()
        
response = users_api.add_user(_first_name, _last_name, _email, _password)

@auth_token = response.body.match(/"token":"([^"]*)"/)[1]
puts("ADD USER: #{response}")

# ADD CONTACT

contacts_api = ContactsAPI.new()
response = contacts_api.add_contact(@auth_token, _first_name, _last_name, _dob, _contact_email,
    _phone, _address_1, _address_2, _city, _state, _zip, _country)

@contact_id = response.body.match(/"_id":"([^"]*)"/)[1]

puts("ADD CONTACT: #{response}")

# GET CONTACT LIST
response = contacts_api.get_contact_list(@auth_token)
puts("GET CONTACT LIST: #{response}")

# GET CONTACT
response = contacts_api.get_contact(@auth_token, @contact_id)
puts("GET CONTACT: #{response}")


_first_name = 'Test_update'
_last_name = 'Testerson_updated'

_contact_email = "test@email.net"
_dob = DateTime.now.strftime("%Y-%m-%d")
_phone = DateTime.now.strftime("%Y%m%d%S")
_address_1 = DateTime.now.strftime("%H%M Test Rd")
_address_2 = DateTime.now.strftime("Apartment #%S")
_city = 'Los Angeles'
_state = 'California'
_zip = '90210'
_country = 'United States of America'

# UPDATE CONTACT
response = contacts_api.update_contact(@auth_token, @contact_id, _first_name, _last_name, _dob, _contact_email,
_phone, _address_1, _address_2, _city, _state, _zip, _country)
puts("UPDATE CONTACT: #{response}")

_patch_data = {'firstName': 'Patch'}

# PATCH CONTACT
response = contacts_api.patch_contact(@auth_token, @contact_id, _patch_data)
puts("PATCH CONTACT: #{response}")

# DELETE CONTACT
response = contacts_api.delete_contact(@auth_token, @contact_id)
puts("DELETE CONTACT: #{response}")

# DELETE USER
response = users_api.delete_user(@auth_token)

puts("DELETE USER: #{response}")