require 'net/http'

# Crawl my beauties!!
class MonkeyCrawler
  attr_accessor :run_monkey, :monkey_testing_state
  attr_reader :monkeys, :site_hits, :sites_created

  def initialize
    @run_monkey = true
    @monkey_testing_state = false
    @monkeys = []
    @site_hits = 0
    @sites_created = 0
  end

  def monkey_crawler
    while @run_monkey == true
      @sites_created += 1
      site = randomize_site
      save_monkeys(site) if isAlive?(site)
      break if @monkey_testing_state == true
    end
  end

  def save_monkeys(site)
    @monkeys << site
    @site_hits += 1
  end

  def randomize_site
    min_length = rand(1..5)
    max_length = rand(10..30)

    ('a'..'z').to_a.shuffle[min_length, max_length].join
  end

  def monkey_randomiser_test(query)
    query.empty? ? true : false
  end

  def isAlive?(url_str)
    # create workable url
    site1 = 'https://www.' + url_str + '.com/'
    # site2 = "https://" + url_str + ".com/"
    begin
      Net::HTTP.get_response(URI.parse(site1)).is_a?(Net::HTTPSuccess)
    # Net::HTTP.get_response(URI.parse(site2)).is_a?(Net::HTTPSuccess)
    rescue StandardError
      false
    end
  end
end
