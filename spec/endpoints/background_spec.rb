require 'rails_helper'

describe "Retrieving a background image for a city", :type => :request do
  it 'can find an image relating to the city and return the url', :vcr do
    get '/api/v1/backgrounds?location=denver,co', headers: {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    expect(response).to be_successful
    image = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

    expect(image[:url]).to_not be_falsey
    expect(image[:url]).to be_a String
  end
end
