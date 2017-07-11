require 'spec_helper'
require 'pry'

describe Bluepark::Client::Taxonomies, vcr: true do
  let!(:client) { Bluepark::Client.new(user_name: 'admin', bluepark_api_uri: 'https://bp155.betapark.co.uk/api/v1/', bluepark_token: 'df8df9af61a022bb08dfdae14a6c96428ca53362').taxonomies }

  it 'gets list of taxonomies' do
    expect(client.retrieve_tree.count).to be_eql(12)
  end

  it 'return count of taxonomys' do
    expect(client.count).to be_eql(12)
  end
end
