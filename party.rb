# require 'json'

# response = HTTParty.get('https://api.github.com/users/eddroid')
#
# # puts response.body['login']
# # response.code, response.message, response.headers.inspect
#
# body = JSON.parse response.body
#
# puts body['login']

# data = {
#   name: "Rodrigo",
#   id: "rpereira2",
#   email: "hello@hotmail.com"
#
# }
#
# response = HTTParty.put('http://requestb.in/1n4e0i61', body: data)
#
# puts response.body
require 'sinatra'
require 'httparty'
require 'nokogiri'

get '/' do
  category = params["job"]
  url = "https://miami.craigslist.org/search/#{category}?s=0"
  response = HTTParty.get url

  dom = Nokogiri::HTML(response.body)

  job_titles =

    dom.css('.hdrlnk').map do |obj|
      obj.text
    end

  p job_titles
end
