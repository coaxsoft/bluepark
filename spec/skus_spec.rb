require 'spec_helper'
require 'pry'

describe Bluepark::Client::Skus, vcr: true do
  let!(:client) { Bluepark::Client.new(user_name: 'admin', bluepark_api_uri: 'https://bp155.betapark.co.uk/api/v1/', bluepark_token: 'df8df9af61a022bb08dfdae14a6c96428ca53362').skus }
  let(:sku) { { sku: 'ABC2', title: 'Test sku' } }
  let(:sku_to_create) { { sku: 'ABC1', title: 'Test sku' } }

  it 'gets list of skus' do
    expect(client.get_skus.count).to be_eql(10)
  end

  it 'return count of skus' do
    expect(client.count).to be_eql(10)
  end

  it 'gets list of skus with limit and offset' do
    expect(client.get_skus(limit:1, page:1).first['sku']).to be_eql('abc')
    expect(client.get_skus(limit:1, page:2).first['sku']).to be_eql('ABC1')
  end

  it 'returns single sku' do
    expect(client.get_sku('abc')['sku']).to be_eql('abc')
  end

  it 'updates single sku with given params' do
    expect(client.update_single_sku('abc', {quantity_in_stock: 20})["updated"]).to be_eql(1)
  end

  it 'raises error if record not found' do
    expect{ client.get_sku('100') }.to raise_error(BlueparkError)
    expect{ client.get_skus(limit:100, page: 2) }.to raise_error(BlueparkError)
  end
end
