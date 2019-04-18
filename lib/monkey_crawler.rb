require "net/http"

def monkey_crawler
    safety = 1
    sites = []
    working = 0

    while safety < 5
        site = randomize_site
        if isAlive?(site)
            puts site
            working += 1
        else 
            puts "It works!!!!!"
        end
        sites << site
        safety += 1
    end
end

def randomize_site
    min_length = rand(1..5)
    max_length = rand(10..30)

    ('a'..'z').to_a.shuffle[min_length,max_length].join
end

def isAlive?(url_str)
  # create workable url
  site1 = "https://www." + url_str + ".com"
  site2 = "https://" + url_str + ".com"
  begin
    Net::HTTP.get_response(URI.parse(site1)).is_a?(Net::HTTPSuccess)
    Net::HTTP.get_response(URI.parse(site2)).is_a?(Net::HTTPSuccess)
  rescue
    false
  end
end

monkey_crawler