require_relative '../helpers/api_helper'

class ContactsAPI

    def add_contact(auth_token, first_name = "John", last_name = "Doe", birth_date = "1970-01-01",
        email="jdoe@fake.com", phone = "8005555555", street_1 = "1 Main St.", street_2 = "Apartment A",
        city = "Anytown", state_or_province = "KS", postal_code = "12345", country = "USA")

        url = "https://thinking-tester-contact-list.herokuapp.com/contacts"
        data = {
            'firstName': first_name,
            'lastName': last_name,
            'birthdate': birth_date,
            'email': email,
            'phone': phone,
            'street1': street_1,
            'street2': street_2,
            'city': city,
            'stateProvince': state_or_province,
            'postalCode': postal_code,
            'country': country
        }
        request_type = :post
        headers = {
            'authorization': "Bearer #{auth_token}"
        }

        api_call = APICall.new(url, data, request_type, headers)
        return api_call.execute()
    end

    def get_contact_list(auth_token)
        url = "https://thinking-tester-contact-list.herokuapp.com/contacts"
        data = {}
        request_type = :get
        headers = {
            'authorization': "Bearer #{auth_token}"
        }

        api_call = APICall.new(url, data, request_type, headers)
        return api_call.execute()
    end

    def get_contact(auth_token, contact_id)
        url = "https://thinking-tester-contact-list.herokuapp.com/contacts/" + contact_id
        data = {}
        request_type = :get
        headers = {
            'authorization': "Bearer #{auth_token}"
        }

        api_call = APICall.new(url, data, request_type, headers)
        return api_call.execute()
    end

    def update_contact(auth_token, contact_id, first_name = "John", last_name = "Doe", birth_date = "1970-01-01",
        email="jdoe@fake.com", phone = "8005555555", street_1 = "1 Main St.", street_2 = "Apartment A",
        city = "Anytown", state_or_province = "KS", postal_code = "12345", country = "USA")

        url = "https://thinking-tester-contact-list.herokuapp.com/contacts/" + contact_id
        data = {
            'firstName': first_name,
            'lastName': last_name,
            'birthdate': birth_date,
            'email': email,
            'phone': phone,
            'street1': street_1,
            'street2': street_2,
            'city': city,
            'stateProvince': state_or_province,
            'postalCode': postal_code,
            'country': country
        }
        request_type = :put
        headers = {
            'authorization': "Bearer #{auth_token}"
        }

        api_call = APICall.new(url, data, request_type, headers)
        return api_call.execute()
    end

    def patch_contact(auth_token, contact_id, data = {'firstName': 'Patch'})

        url = "https://thinking-tester-contact-list.herokuapp.com/contacts/" + contact_id
        request_type = :patch
        headers = {
            'authorization': "Bearer #{auth_token}"
        }

        api_call = APICall.new(url, data, request_type, headers)
        return api_call.execute()
    end

    def delete_contact(auth_token, contact_id)

        url = "https://thinking-tester-contact-list.herokuapp.com/contacts/" + contact_id
        data = {}
        request_type = :delete
        headers = {
            'authorization': "Bearer #{auth_token}"
        }

        api_call = APICall.new(url, data, request_type, headers)
        return api_call.execute()
    end
end