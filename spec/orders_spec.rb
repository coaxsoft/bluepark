require 'spec_helper'

describe Bluepark::Client::Orders, vcr:true do
  let!(:client) { Bluepark::Client.new(user_name: 'admin', bluepark_api_uri: 'https://bp155.betapark.co.uk/api/v1/', bluepark_token: 'df8df9af61a022bb08dfdae14a6c96428ca53362').orders }
  let(:order) { { email_address: 'example@example.com', billing_address: {first_name: 'Test', last_name: 'Test', address_line_1: 'Fake Street 1', town_city:'Bucharest',postcode: '750110',country_code: 'UK'} } }

  it 'gets list of orders' do
    expect(client.get_orders.count).to be_eql(10)
  end

  it 'gets list of orders with limit and offset' do
    expect(client.get_orders(limit:1, page:2).first["id"]).to be_eql(2)
    expect(client.get_orders(limit:1, page:3).first["id"]).to be_eql(3)
  end

  it 'returns order by id' do
    expect(client.get_order(2)["id"]).to be_eql(2)
  end

  it 'creates order with basic params' do
    expect(client.create_order(order)["created"]).to be_eql(1)
  end

  it 'updates single order with given params' do
    expect(client.update_single_order(2, {email_address: 'abc@hotmail.com'})["updated"]).to be_eql(1)
  end

  it 'deletes order by id' do
    expect(client.count).to be_eql(11)
    client.delete_order_by_id(2)
    expect(client.count).to be_eql(10)
  end

  it 'deletes all orders' do
    client.delete_all_orders
    expect(client.count).to be_eql("0")
  end

  it 'raises error if record not found' do
    expect{ client.get_order(100) }.to raise_error(BlueparkError)
    expect{ client.get_orders(limit:100, page: 2) }.to raise_error(BlueparkError)
  end
end
