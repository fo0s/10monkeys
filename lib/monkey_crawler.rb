# frozen_string_literal: true

require 'net/http'

# Crawl my beauties!!
class MonkeyCrawler
  attr_accessor :run_monkey, :monkey_testing_state, :monkeys
  attr_reader :site_hits, :sites_created

  def initialize
    @run_monkey = true
    @monkey_testing_state = false
    @monkeys = []
    @site_hits = 0
    @sites_created = 0
    @domains = ['.com', '.io', '.gov', '.edu', '.net', '.org', '.xyz', '.tech']
  end

  def start_monkeys
    monkey1 = Thread.new { monkey_crawler }
    monkey2 = Thread.new { monkey_crawler }
    monkey3 = Thread.new { monkey_crawler }
    monkey4 = Thread.new { monkey_crawler }
    monkey5 = Thread.new { monkey_crawler }
    true
  end

  def monkey_crawler
    while @run_monkey == true
      @sites_created += 1
      site = randomize_site
      @domains.each do |domain|
        site_check = 'https://www.' + site + domain
        save_monkeys(site_check) if isAlive?(site_check)
      end
      break if @monkey_testing_state == true
    end
  end

  def save_monkeys(site)
    @monkeys << site
    @site_hits += 1
  end

  def randomize_site
    min_length = 2
    max_length = rand(4..12)

    ('a'..'z').to_a.shuffle[min_length, max_length].join
  end

  def monkey_randomiser_test(query)
    query.empty? ? true : false
  end

  def isAlive?(url_str)
    Net::HTTP.get_response(URI.parse(url_str)).is_a?(Net::HTTPSuccess)
  rescue StandardError
    false
  end
end
