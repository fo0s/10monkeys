require_relative "./lib/monkey_crawler.rb"
require_relative "./lib/monkey_scraper.rb"
require_relative "./lib/database_spreadsheet.rb"

require "google_drive"
require "time"

def monkey_monitor	
	# Setup
	@scraper = MonkeyScrapper.new
	@start_time = Time.now
	@mdata = GoogleDatabase.new
	@mdata.worksheet_database(:web)
	
	# Initiate crawlers
	puts "Creating 5 monkeys"
	@monkey = MonkeyCrawler.new
	@monkey.start_monkeys
	
	# Start processes
	 loop do
		puts "Please choose: "
		puts "1 for status"
		puts "2 to list sites found"
		puts "3 to scrape sites and store"
		puts "4 to quit"
	
		input = gets.strip
		monkey_menu(input)
	 end
end

def monkey_menu(input)
	case input
	when "1"
		puts "Started: #{@start_time}. Now: #{Time.now}. "
		puts "#{@monkey.sites_created} created. #{@monkey.site_hits} hits"
	when "2"
		puts "The sites found are: #{@monkey.monkeys}."
	when "3"
	
		@monkey.monkeys.each do |site|
			p site
			scraper_result = @scraper.scrape(site)
			@mdata.write_database(scraper_result)
		end
		puts "done"
	when "4"
		@monkey_testing_state = true
		@monkey.run_monkey = false
	else 
		puts "I don't recognise that"
	end
end

# htpps://www.unbk.net

# TODO 
# 1. Be able to merge results

monkey_monitor
