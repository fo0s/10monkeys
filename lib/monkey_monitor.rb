require_relative "monkey_crawler.rb"

require "time"

def monkey_monitor
	puts "Creating 6 monkeys"
	monkey = MonkeyCrawler.new
	monkey.start_monkeys
	
	# Start processes
	
	 loop do
		puts Time.now
		
		sleep(60)
		puts "Total hits: #{monkey.site_hits}"
		puts "Total sites: #{monkey.sites_created}"
		p "Sites found: #{monkey.monkeys}"
		
		puts "-------------------------------------------------------"
	
	 end
	
end

monkey_monitor
