require 'httparty'
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

require 'nokogiri'

url = "https://www.indeed.com/jobs?q=software+engineer&l=Boca+Raton%2C+FL"

response = HTTParty.get url

dom = Nokogiri::HTML(response.body)

job_titles =

  dom.css('.jobtitle').map do |obj|
    obj.text
  end

p job_titles
