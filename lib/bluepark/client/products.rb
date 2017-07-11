require 'rest-client'
require 'pry'

class Bluepark::Client::Products
  def initialize(client)
    @client = client
  end

  def get_products(params = {})
    @client.rest_get_with_token('products/', params)
  end

  def get_product(product_id, params = {})
    @client.rest_get_with_token("products/#{product_id}", params)
  end

  def count(params = {})
    @client.rest_get_with_token('products/count', params)['count']
  end

  def create_product(product_params)
    @client.rest_post_with_token('products', product_params)
  end

  def update_single_product(product_id, product_params)
    @client.rest_put_with_token("products/#{product_id}", product_params)
  end

  def delete_product_by_id(product_id)
    @client.rest_delete_with_token("products/#{product_id}")
  end

  def delete_all_products
    @client.rest_delete_with_token('products/all')
  end

  def delete_filtered_products(params = {})
    @client.rest_delete_with_token('products', params)
  end
end
