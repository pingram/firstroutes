require 'addressable/uri'
require 'rest-client'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/1.json',
  # query_values:

).to_s
p url
#   vals = {:name => 'bob'

# puts RestClient.get(url)

def create_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/3.json'
  ).to_s

  puts RestClient.delete(
    url,
    { :user => { :name => "Jimmy", :email => "jimbo@gmail.com" } }
  )
end

create_user