require 'rails_helper'

describe 'I can recieve a forcase for a city', :type => :request do
  it 'Can return all needed information based off of FE wireframe', :vcr do

    get '/api/v1/forecast?location=denver,co', headers: {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    expect(response).to be_successful

    forcast = JSON.parse(response.body, symbolize_names: true)[:data][:attributes][:full_cast]

    expect(forcast[:location]).to be_a String
    expect(forcast[:currently].keys).to eq([:time, :summary, :feels_like, :humidity, :visibility, :uv_index, :temp, :icon])
    expect(forcast[:today].keys).to eq([:today_summary, :tonight_summary, :high, :low, :date])
    expect(forcast[:hourly].length).to eq(8)
    expect(forcast[:hourly][0].keys).to eq([:time, :temp, :icon])
    expect(forcast[:daily].length).to eq(5)
    expect(forcast[:daily][0].keys).to eq([:summary, :precipitation_prob, :precipitation_type, :high, :low, :day, :icon])
  end
end
