require 'rails_helper'

describe 'I can recieve a current weather for a antipose city', :type => :request do
  it 'Can return Location name and current forcash and search location', :vcr do
    get '/api/v1/antipode?location=hongkong'

    expect(response).to be_successful

    city = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
    
    expect(city[:location_name]).to eq('RP69, Jujuy, Argentina')
    expect(city[:search_location]).to eq('hongkong')
    expect(city[:currently].keys).to eq([:summary, :temperature])
    expect(city[:currently][:summary]).to be_a String
    expect(city[:currently][:temperature]).to be_a Float
  end
end
