require 'rest-client'

class Bluepark::Client::Skus
  def initialize(client)
    @client = client
  end

  def get_skus(params = {})
    @client.rest_get_with_token('skus/', params)
  end

  def get_sku(sku_id)
    @client.rest_get_with_token("skus/#{sku_id}")
  end

  def count(params = {})
    @client.rest_get_with_token('skus/count', params)
  end

  def update_single_sku(sku_id, sku_params)
    @client.rest_put_with_token("skus/#{sku_id}", sku_params)
  end

  def delete_sku_by_id(sku_id)
    @client.rest_delete_with_token("skus/#{sku_id}")
  end

  def delete_all_skus
    @client.rest_delete_with_token('skus/all')
  end
end
