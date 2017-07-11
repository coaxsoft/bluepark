class Bluepark
  def self.client(credentials = {})
    Client.new(credentials)
  end
end

require 'bluepark/client'
