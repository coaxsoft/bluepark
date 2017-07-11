require 'spec_helper'

describe Bluepark do
  it 'Creates Bluepark client' do
    expect(Bluepark.client(user_name: 'test_user', bluepark_api_uri: 'http://yourshop.betapark.co.uk/api/v1/', bluepark_token: 'abcabcabc')).to be_a(Bluepark::Client)
  end
end
