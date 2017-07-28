require 'rest-client'
require 'base64'
require 'oj'
require 'pry'
class Bluepark::Client
  attr_accessor :bluepark_token, :user_name, :bluepark_api_uri
  STATUS_CODES = { 200 => 'success',
                   304 => 'not_modified',
                   400 => 'bad_request',
                   401 => 'unauthorized',
                   403 => 'forbidden',
                   404 => 'not_found',
                   405 => 'method_not_allowed',
                   406 => 'not_acceptable',
                   413 => 'too_large_request',
                   415 => 'unsupported_mediatype',
                   429 => 'too_many_requests',
                   500 => 'internal_server_error' }.freeze

  def initialize(config = {})
    @user_name = config[:user_name]
    @bluepark_token = config[:bluepark_token]
    @bluepark_api_uri = config[:bluepark_api_uri]
  end

  def encode_json(data)
    Oj.dump(data, mode: :compat)
  end

  def decode_json(json)
    Oj.load(json) if json != ''
  end

  def decode_status(response)
    if response.body.nil? || response.body.strip.empty? || response.code >= 300
      error = {
        status: STATUS_CODES[response.code],
        status_code: response.code
      }.merge(decode_json(response.body).to_h)
      raise BlueparkError, encode_json(error)
    else
      decode_json(response.body)
    end
  end

  def api_call_with_token(action, path, options = {})
    headers = { Authorization: "Basic #{token}" }
    headers.merge!(options[:headers]) if options[:headers].is_a?(Hash)
    headers[:Accept] = 'text/json'
    headers[:"content-type"] = 'application/json'
    args = ["#{@bluepark_api_uri}#{path}"]
    args << encode_json(options[:body]) unless options[:body].nil?
    args << headers

    begin
      response = RestClient.send(action, *args)
      decode_status(response)
    rescue RestClient::ExceptionWithResponse => e
      decode_status(e.response)
    end
  end

  def rest_get_with_token(path, query_params = {})
    headers = query_params.empty? ? nil : { params: query_params }
    api_call_with_token(:get, path, headers: headers)
  end

  def rest_put_with_token(path, body = {})
    api_call_with_token(:put, path, body: body)
  end

  def rest_post_with_token(path, body = {})
    api_call_with_token(:post, path, body: body)
  end

  def rest_delete_with_token(path, body = {})
    api_call_with_token(:delete, path, body)
  end

  def orders
    Orders.new(self)
  end

  def products
    Products.new(self)
  end

  def skus
    Skus.new(self)
  end

  def taxonomies
    Taxonomies.new(self)
  end

  def sales(order_id)
    Sales.new(self, order_id)
  end

  def company
    rest_get_with_token('company')
  end

  private

  def token
    Base64.encode64("#{@user_name}:#{@bluepark_token}").tr("\n", '')
  end
end

require 'bluepark/client/orders'
require 'bluepark/client/products'
require 'bluepark/client/skus'
require 'bluepark/client/taxonomies'
require 'bluepark/client/sales'
require 'bluepark/errors/bluepark_error'
