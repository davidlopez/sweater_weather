require 'rails_helper'

describe 'I can create a user resource', :type => :request do
  before(:each) do
    @user = User.create({
      email: "whatever@example.com",
      password: "password",
      password_confirmation: "password"
    })
  end

  it 'can take in registration info and then return that users API key' do

    post '/api/v1/sessions', params: {
      email: "whatever@example.com",
      password: "password",
    }.to_json, headers: {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    expect(response).to be_successful
    user_key = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
    expect(user_key).to eq({api_key: @user.api_key})
  end

  it 'cant make a user with invalid information' do

    post '/api/v1/sessions', params: {
      email: "whatever@example.com",
      password: "pass",
    }.to_json, headers: {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    expect(response).to_not be_successful
    errored_response = JSON.parse(response.body, symbolize_names: true)
    expect(errored_response[:failed]).to eq('Bad credentials')
  end
end
