require 'spec_helper'
require 'pry'

describe Bluepark::Client::Products, vcr: true do
  let!(:client) { Bluepark::Client.new(user_name: 'admin', bluepark_api_uri: 'https://bp155.betapark.co.uk/api/v1/', bluepark_token: 'df8df9af61a022bb08dfdae14a6c96428ca53362').products }
  let(:product) { { sku: 'ABC2', title: 'Test product' } }
  let(:product_to_create) { { sku: 'ABC1', title: 'Test product' } }

  it 'gets list of products' do
    expect(client.get_products.count).to be_eql(10)
  end

  it 'gets list of pruducts with limit and offset' do
    expect(client.get_products(limit:1, page:2).first["id"]).to be_eql(2)
    expect(client.get_products(limit:1, page:3).first["id"]).to be_eql(3)
  end

  it 'returns product by id' do
    expect(client.get_product(2)["id"]).to be_eql(2)
  end

  it 'creates product with basic params' do
    expect(client.create_product(product_to_create)["created"]).to be_eql(1)
  end

  it 'updates single product with given params' do
    expect(client.update_single_product(2, product)["updated"]).to be_eql(1)
  end

  it 'deletes product by id' do
    expect(client.count).to be_eql(1)
    client.delete_product_by_id(2)
    expect(client.count).to be_eql('0')
  end

  it 'deletes all products' do
    client.delete_all_products
    expect(client.count).to be_eql('0')
  end

  it 'raises error if record not found' do
    expect{ client.get_product(100) }.to raise_error(BlueparkError)
    expect{ client.get_products(limit:100, page: 2) }.to raise_error(BlueparkError)
  end
end
