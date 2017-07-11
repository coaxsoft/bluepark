require 'rest-client'

class Bluepark::Client::Orders
  def initialize(client)
    @client = client
  end

  def get_orders(params = {})
    @client.rest_get_with_token('orders/', params)
  end

  def get_order(order_id)
    @client.rest_get_with_token("orders/#{order_id}")
  end

  def count(params = {})
    @client.rest_get_with_token('orders/count', params)['count']
  end

  def create_order(order_params)
    @client.rest_post_with_token('orders', order_params)
  end

  def update_single_order(order_id, order_params)
    @client.rest_put_with_token("orders/#{order_id}", order_params)
  end

  def delete_order_by_id(order_id)
    @client.rest_delete_with_token("orders/#{order_id}")
  end

  def delete_all_orders
    @client.rest_delete_with_token('orders/all')
  end
end
