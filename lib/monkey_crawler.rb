require 'open-uri'
require 'nokogiri'
require 'json'
require "net/http"

def randomize_site()
    min_length = rand(1..5)
    max_length = rand(10..30)

    ('a'..'z').to_a.shuffle[min_length,max_length].join
end

def isAlive?(site)
    url = URI.parse("www." + site + ".com")
    req = Net::HTTP.new(url.host, url.port)
    res = req.request_head(url.path)
    puts res.code
end

puts checkAlive