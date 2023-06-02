require 'net/http'
require 'json'

class GetRequester
  def initialize(url)
    @url = url
  end

  def get_response_body
    uri = URI(@url)
    response = Net::HTTP.get_response(uri)
    response.body
  end

  def parse_json
    json_string = get_response_body
    JSON.parse(json_string)
  end
end
get_requester = GetRequester.new('https://learn-co-curriculum.github.io/json-site-example/endpoints/people.json')
result = get_requester.parse_json
puts result
