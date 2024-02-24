require 'rest-client'
require 'json'

url = 'https://thinking-tester-contact-list.herokuapp.com/users/login'

# Prepare the request data
data = {'email': 'test20240223131159@email.com', 'password': '20240223131159'}

begin
    # Make a POST request
    response = RestClient.post(url, data.to_json, {
        content_type: :json,
        accept: :json,
        # authorization: "Bearer #{token}",
        user_agent: 'RestClient',
        connection: 'keep-alive'
    })

    # Output the response
    puts "Response Code: #{response.code}"
    puts "Response Body: #{response.body}"
rescue RestClient::ExceptionWithResponse => e
    # Handle HTTP errors
    puts "Error: #{e.message}, Response: #{e.response.body}"
rescue StandardError => e
    # Handle other errors
    puts "Error: #{e.message}"
end