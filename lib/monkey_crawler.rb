require "net/http"

# Crawl my beauties!!
class MonkeyCrawler
  attr_accessor :run_monkey
  attr_reader :monkeys, :site_hits

  def initialize
    @run_monkey = true
    @monkeys = []
    @site_hits = 0
    monkey_crawler
  end

  def monkey_crawler
    while @run_monkey == true
      site = randomize_site

      if isAlive?(site)
        @monkeys << site
        @site_hits += 1
      end
    end
  end

  def randomize_site
    min_length = rand(1..5)
    max_length = rand(10..30)

    ('a'..'z').to_a.shuffle[min_length,max_length].join
  end

  def isAlive?(url_str)
    # create workable url
    site1 = "https://www.#{url_str}.com/"
    site2 = "https://#{url_str}.com/"
    begin
      Net::HTTP.get_response(URI.parse(site1)).is_a?(Net::HTTPSuccess)
      Net::HTTP.get_response(URI.parse(site2)).is_a?(Net::HTTPSuccess)
    rescue
      false
    end
  end
end