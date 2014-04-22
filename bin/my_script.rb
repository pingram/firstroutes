require 'addressable/uri'
require 'rest-client'

url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users.json',
  query_values: {
      'person[age]' => 200,
      'person[name]' => 'bob',
      'person[last_name]' => 'jenkins',
      'person[likes][cats]' => 'gizmo'
  }
).to_s
#   vals = {:name => 'bob'

puts RestClient.get(url)