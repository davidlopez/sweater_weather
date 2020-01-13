require 'rails_helper'

describe 'I can recieve a current weather for a antipose city', :type => :request do
  it 'Can return Location name and current forcash and search location', :vcr do
    get '/api/v1/antipode?location=hongkong'

    expect(response).to be_successful
    city = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
    binding.pry

    expect(city[:location]).to eq('La Quiaca, Jujuy, Argentina')
  end
end
