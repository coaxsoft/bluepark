require 'rest-client'

class Bluepark::Client::Taxonomies
  def initialize(client)
    @client = client
  end

  def retrieve_tree
    @client.rest_get_with_token('taxonomy/')
  end

  def count
    @client.rest_get_with_token('taxonomy/count')
  end
end
