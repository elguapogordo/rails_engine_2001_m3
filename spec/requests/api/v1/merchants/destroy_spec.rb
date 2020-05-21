require 'rails_helper'

describe 'Merchants API, destroy' do
  it 'destroys an existing merchant' do
    merchant1 = Merchant.create!(name: "Merchant One")
    merchant2 = Merchant.create!(name: "Merchant Two")
    merchant3 = Merchant.create!(name: "Merchant Three")

    expect(Merchant.count).to eq(3)

    delete "/api/v1/merchants/#{merchant2.id}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body, symbolize_names: true)

    expect(merchant[:data][:type]).to eq("merchant")
    expect(merchant[:data][:attributes][:name]).to eq("Merchant Two")
    expect(Merchant.count).to eq(2)
  end
end
