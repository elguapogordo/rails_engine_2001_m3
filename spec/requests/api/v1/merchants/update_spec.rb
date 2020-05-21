require 'rails_helper'

describe 'Merchants API, update' do
  it 'updates an existing merchant' do
    merchant1 = Merchant.create!(name: "Merchant One")
    merchant2 = Merchant.create!(name: "Merchant Two")
    merchant3 = Merchant.create!(name: "Merchant Three")
    name = "Merchant Drei"
    body = {
      name: name
    }

    patch "/api/v1/merchants/#{merchant3.id}", params: body

    expect(response).to be_successful

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(merchant[:data][:type]).to eq("merchant")
    expect(merchant[:data][:attributes][:name]).to eq("Merchant Drei")
  end
end
