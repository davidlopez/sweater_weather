require 'rails_helper'

describe 'I can create a user resource', :type => :request do
  it 'can take in registration info and then return that users API key' do

    post '/api/v1/users', params: {
      email: "whatever@example.com",
      password: "password",
      password_confirmation: "password"
    }.to_json, headers: {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    expect(response).to be_successful
    user_key = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
    user = User.last
    expect(user_key).to eq({api_key: user.api_key})
  end

  it 'cant make a user with invalid information' do
    user = User.create({
      email: "whatever@example.com",
      password: "password",
      password_confirmation: "password"
    })

    post '/api/v1/users', params: {
      email: "whatever@example.com",
      password: "password",
      password_confirmation: "password"
    }.to_json, headers: {
      'Content-Type' => 'application/json',
      'Accept' => 'application/json'
    }

    expect(response).to_not be_successful
    errored_response = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]
    expect(errored_response[:failed][:email]).to eq(["has already been taken"])
  end
end
