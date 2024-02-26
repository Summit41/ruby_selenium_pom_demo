require_relative '../helpers/api_helper'

class UsersAPI

    def register(first_name, last_name, email, password)
        url = 'https://thinking-tester-contact-list.herokuapp.com/users'
        
        # Prepare the request data
        data = {
            'firstName': first_name,
            'lastName': last_name,
            'email': email,
            'password': password
        }
        
        api_call = APICall.new(url, data, :post, {})
        return response = api_call.execute
    end

    def login(email = "test20240223131159@email.com", password = "20240223131159")
        url = 'https://thinking-tester-contact-list.herokuapp.com/users/login'
        
        # Prepare the request data
        data = {
            'email': email,
            'password': password
        }
        
        api_call = APICall.new(url, data, :post, {})
        return response = api_call.execute
    end

    def logout(auth_token)
        url = 'https://thinking-tester-contact-list.herokuapp.com/users/logout'
        
        data = {}
        headers = {
            'authorization': "Bearer #{auth_token}"
        }
        api_call = APICall.new(url, data, :post, headers)
        return response = api_call.execute
    end
end