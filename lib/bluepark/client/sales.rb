require 'rest-client'

class Bluepark::Client::Sales
  def initialize(client, order_id)
    @client = client
    @order_id = order_id
  end

  def get_products(params = {})
    @client.rest_get_with_token("orders/#{@order_id}/products/", params)
  end

  def get_product(product_id)
    @client.rest_get_with_token("orders/#{@order_id}/products/#{product_id}")
  end

  def count(params = {})
    @client.rest_get_with_token("orders/#{@order_id}/products/count", params)['count']
  end

  def create_product(product_params)
    @client.rest_post_with_token("orders/#{@order_id}/products", product_params)
  end

  def update_single_product(product_id, product_params)
    @client.rest_put_with_token("orders/#{@order_id}/products/#{product_id}", product_params)
  end

  def delete_product_by_id(product_id)
    @client.rest_delete_with_token("orders/#{@order_id}/products/#{product_id}")
  end

  def delete_all_products
    @client.rest_delete_with_token("orders/#{@order_id}/products/all")
  end
end
