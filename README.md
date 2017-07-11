# Bluepark Ruby Gem

## Installation

Add this line to your application's Gemfile:

```  gem 'bluepark'```

And then execute:

```$ bundle```

Or install it yourself as:

```$ gem install bluepark```

## Usage

For full understaning check out [Bluepark Api Specification](https://www.bluepark.co.uk/api-specification.html).

Initialize your client:

```ruby
client = Bluepark.client(user_name: 'test_user', bluepark_api_uri: 'http://yourshop.betapark.co.uk/api/v1/', bluepark_token: 'abcabcabc')
```

To work with products:

``` ruby
client.products # returns Bluepark::Client::Products object to perform any operations  on products
```
Like:
```ruby
client.products.get_products
client.products.get_product(id)
```
For full listing of methods check [Products methods]('http://www.rubydoc.info/gems/bluepark/1.0.1/Bluepark/Client/Products')


To work with orders:
``` ruby
client.orders # returns Bluepark::Client::Orders object to perform operations on orders
```
Like:
```ruby
client.orders.get_orders
client.orders.get_order(id)
```
For full listing of methods check [Orders methods]('http://www.rubydoc.info/gems/bluepark/1.0.1/Bluepark/Client/Orders').
Full listing of all classes and methods is available here:
[Rubydoc](http://www.rubydoc.info/gems/bluepark/1.0.1/Bluepark)
# Exception handling

Gem throws ```BlueparkException``` like this:
``` ruby
BlueparkError: {"status":"not_found","status_code":404,"error":{"code":404,"phrase":"Not Found","message":"Resource not found"}}
```
Possible variants for ```status``` and ```status_code``` are:
```ruby
200 => 'success',
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
500 => 'internal_server_error'
```
```error``` is an error returned from Bluepark Api
# License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

