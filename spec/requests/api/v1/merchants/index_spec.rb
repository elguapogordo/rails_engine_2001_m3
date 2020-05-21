require 'rails_helper'

describe 'Merchants API, index' do
  it 'sends a list of merchants' do
    merchant1 = Merchant.create!(name: "Merchant One")
    merchant2 = Merchant.create!(name: "Merchant Two")
    merchant3 = Merchant.create!(name: "Merchant Three")

    get '/api/v1/merchants'

    expect(response).to be_successful

    merchants = JSON.parse(response.body, symbolize_names: true)

    expect(merchants[:data][1][:type]).to eq("merchant")
    expect(merchants[:data][1][:attributes][:name]).to eq("Merchant Two")
  end
end
