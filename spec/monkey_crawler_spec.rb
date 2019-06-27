require 'monkey_crawler'

describe 'Monkey crawler' do
  before(:each) { @monkey = MonkeyCrawler.new }

  context '#a monkey is spawned' do
    it 'will run as a whole' do
      @monkey.monkey_testing_state = true
      @monkey.monkey_crawler
      expect(@monkey.sites_created).to be 1
    end

    it 'can save a succesful hit' do
      @monkey.save_monkeys('test')
      expect(@monkey.site_hits).to eq 1
    end

    it 'can be created and shut down' do
      @monkey.run_monkey = false
      expect(@monkey.run_monkey).to equal false
    end

    it 'wont run if in off mode' do
      @monkey.run_monkey = false
      @monkey.monkey_crawler
      expect(@monkey.sites_created).to equal 0
    end

    it 'checks if monkey_randomiser_test does what its supposed to' do
      expect(@monkey.monkey_randomiser_test('')).to eq true
    end

    it 'creates a random string' do
      monkey_site = @monkey.randomize_site
      expect(@monkey.monkey_randomiser_test(monkey_site)).to eq false
    end

    it 'verifies an active site' do
      expect(@monkey.isAlive?('https://www.google.com')).to be true
    end

    it 'fails a false site' do
      expect(@monkey.isAlive?('thisshouldreturnfalse')).to be false
    end

    it 'checks if threads have been successfully started' do
      @monkey.monkey_testing_state = true
      expect(@monkey.start_monkeys).to be true
    end
  end
end
