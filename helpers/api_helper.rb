require 'rest-client'
require 'json'

class APICall
    @default_headers = {
        content_type: :json,
        accept: :json,
        # authorization: "Bearer #{token}",
        user_agent: 'RestClient',
        connection: 'keep-alive'
    }
    

    def initialize(url, data, request_type, headers = {})
        @url = url
        @request_type = request_type
        @data = data
        
        @headers = self.class.default_headers.merge(headers) do |key, old_val, new_val|
            # Use the new value if it's specified, otherwise use the default value
            new_val.nil? ? old_val : new_val
        end
    end

    def self.default_headers
        @default_headers
    end

    def execute()
        if @request_type == :post
            begin
                response = RestClient.post(@url, @data.to_json, @headers)
            
                return response
            rescue RestClient::ExceptionWithResponse => e
                # Handle HTTP errors
                puts "Error: #{e.message}, Response: #{e.response.body}"
                return e.response
            rescue StandardError => e
                # Handle other errors
                puts "Error: #{e.message}"
            end
        elsif @request_type == :get
            begin
                response = RestClient.get(@url, @headers)
            
                return response
            rescue RestClient::ExceptionWithResponse => e
                # Handle HTTP errors
                puts "Error: #{e.message}, Response: #{e.response.body}"
                return e.response
            rescue StandardError => e
                # Handle other errors
                puts "Error: #{e.message}"
            end
        elsif @request_type == :patch
            begin
                response = RestClient.patch(@url, @data.to_json, @headers)
            
                return response
            rescue RestClient::ExceptionWithResponse => e
                # Handle HTTP errors
                puts "Error: #{e.message}, Response: #{e.response.body}"
                return e.response
            rescue StandardError => e
                # Handle other errors
                puts "Error: #{e.message}"
            end
        elsif @request_type == :put
            begin
                response = RestClient.put(@url, @data.to_json, @headers)
            
                return response
            rescue RestClient::ExceptionWithResponse => e
                # Handle HTTP errors
                puts "Error: #{e.message}, Response: #{e.response.body}"
                return e.response
            rescue StandardError => e
                # Handle other errors
                puts "Error: #{e.message}"
            end
        elsif @request_type == :delete
            begin
                response = RestClient.delete(@url, @headers)
            
                return response
            rescue RestClient::ExceptionWithResponse => e
                # Handle HTTP errors
                puts "Error: #{e.message}, Response: #{e.response.body}"
                return e.response
            rescue StandardError => e
                # Handle other errors
                puts "Error: #{e.message}"
            end
        elsif @request_type == :head
            begin
                response = RestClient.head(@url, @headers)
            
                return response
            rescue RestClient::ExceptionWithResponse => e
                # Handle HTTP errors
                puts "Error: #{e.message}, Response: #{e.response.body}"
                return e.response
            rescue StandardError => e
                # Handle other errors
                puts "Error: #{e.message}"
            end
        elsif @request_type == :options
            begin
                response = RestClient.options(@url, @headers)
            
                return response
            rescue RestClient::ExceptionWithResponse => e
                # Handle HTTP errors
                puts "Error: #{e.message}, Response: #{e.response.body}"
                return e.response
            rescue StandardError => e
                # Handle other errors
                puts "Error: #{e.message}"
            end
        else
            puts "Unsupported request type: #{@request_type}"
        end
    end
end
