require 'net/http'
require 'uri'

def send_data_to_amplitude(account_name)
  # Construct the request payload
  payload = {
    api_key: 'YOUR_API_KEY',
    event_type: 'Account Name',
    event_properties: {
      'Account Name': account_name
    }
  }

  # Convert the payload to JSON
  payload_json = payload.to_json

  # Set up the HTTP request
  uri = URI.parse('https://api.amplitude.com/2/httpapi')
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true

  # Send the POST request to Amplitude
  response = http.post(uri.path, payload_json, {'Content-Type': 'application/json'})

  # Check the response
  if response.code == '200'
    puts 'Data sent successfully to Amplitude.'
  else
    puts 'Failed to send data to Amplitude.'
  end
end

# Example usage
account_name = 'Example Account'
send_data_to_amplitude(account_name)
