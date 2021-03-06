require 'rails_helper'

describe 'Merchants API, create' do
  it 'creates a new merchant' do
    merchant1 = Merchant.create!(name: "Merchant One")
    merchant2 = Merchant.create!(name: "Merchant Two")
    merchant3 = Merchant.create!(name: "Merchant Three")
    name = "Merchant Four"
    body = {
      name: name
    }

    post '/api/v1/merchants', params: body

    expect(response).to be_successful

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(merchant[:data][:type]).to eq("merchant")
    expect(merchant[:data][:attributes][:name]).to eq("Merchant Four")
  end
end
