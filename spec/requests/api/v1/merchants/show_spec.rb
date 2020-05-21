require 'rails_helper'

describe 'Merchants API, show' do
  it 'sends a specific merchant' do
    merchant1 = Merchant.create!(name: "Merchant One")
    merchant2 = Merchant.create!(name: "Merchant Two")
    merchant3 = Merchant.create!(name: "Merchant Three")

    get "/api/v1/merchants/#{merchant2.id}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(merchant[:data][:type]).to eq("merchant")
    expect(merchant[:data][:attributes][:name]).to eq("Merchant Two")
  end
end
