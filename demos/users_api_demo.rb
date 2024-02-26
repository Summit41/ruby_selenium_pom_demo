require_relative '../api_objects/users'

# ADD USER
_timestamp = DateTime.now.strftime("%Y%m%d%H%M%S")
_first_name = 'Test'
_last_name = 'Testerson'
_email = "test+#{_timestamp}@email.com"
_password = _timestamp

users_api = UsersAPI.new()
        
response = users_api.add_user(_first_name, _last_name, _email, _password)

@auth_token = response.body.match(/"token":"([^"]*)"/)[1]
puts("ADD USER: #{response}")

# GET USER PROFILE
response = users_api.get_user_profile(@auth_token)
puts("GET USER PROFILE: #{response}")

# UPDATE USER
_timestamp = DateTime.now.strftime("%Y%m%d%H%M%S")
_first_name = 'Test_updated'
_last_name = 'Testerson_updated'
_email = "test+#{_timestamp}@email.com"
_password = _timestamp

response = users_api.update_user(@auth_token, _first_name, _last_name, _email, _password)

puts("UPDATE USER: #{response}")

# LOG OUT USER
response = users_api.log_out_user(@auth_token)

auth_token = ""

puts("LOG OUT USER: #{response}")

# LOG IN USER
response = users_api.log_in_user(_email, _password)

@auth_token = response.body.match(/"token":"([^"]*)"/)[1]
puts("LOG IN USER: #{response}")

# DELETE USER
response = users_api.delete_user(@auth_token)

puts("DELETE USER: #{response}")