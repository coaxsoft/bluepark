require 'spec_helper'

describe Bluepark::Client, vcr: true do
  let!(:client) { Bluepark::Client.new(user_name: 'admin', bluepark_api_uri: 'https://bp155.betapark.co.uk/api/v1/', bluepark_token: 'df8df9af61a022bb08dfdae14a6c96428ca53362') }

  it 'Creates Bluepark client' do
    expect(client).to be_a(Bluepark::Client)
  end

  it 'Creates products middleware' do
    expect(client.products).to be_a(Bluepark::Client::Products)
  end

  it 'Creates orders middleware' do
    expect(client.orders).to be_a(Bluepark::Client::Orders)
  end

  it 'Creates sales middleware' do
    expect(client.sales(1)).to be_a(Bluepark::Client::Sales)
  end

  it 'Creates skus middleware' do
    expect(client.skus).to be_a(Bluepark::Client::Skus)
  end

  it 'Creates taxonomies middleware' do
    expect(client.taxonomies).to be_a(Bluepark::Client::Taxonomies)
  end

  it 'returns company info' do
    expect(client.company['email_address']).not_to be_empty
  end
end
