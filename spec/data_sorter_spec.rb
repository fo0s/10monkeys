require 'data_sorter'
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
      @monkey.save_monkeys("test")
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

    it 'creates a random string' do
      monkey_site = @monkey.randomize_site
      expect(@monkey.monkey_randomiser_test(monkey_site)).to eq false
    end

    it 'verifies an active site' do
      expect(@monkey.isAlive?("google")).to be true
    end

    it 'fails a false site' do
      expect(@monkey.isAlive?("thisshouldreturnfalse")).to be false
    end
  end
end

describe 'Data sorter- ' do
  context '#load file- ' do
    it 'file has been loaded' do
      test_file = ComparativeData.new("./lib/resource/test_file_super_easy.txt")
      test_file.process_file
      expect(test_file.output).to eq [["Super", 1],["Easy", 1]]
    end

    it 'can sort words' do
      test_file = ComparativeData.new("./lib/resource/test_file_easy.txt")
      test_file.process_file
      expect(test_file.output).to eq [["This", 21], ["is", 21], ["a", 21], ["test.", 21]]
    end
  end
end
