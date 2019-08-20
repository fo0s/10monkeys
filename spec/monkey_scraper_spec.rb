# frozen_string_literal: true

require 'monkey_scraper'

describe 'Monkey Scraper' do
  context '#connecting to site- ' do
    it 'can connect to the oldest active website on record' do
      monkey = MonkeyScrapper.new
      monkey.scrape('http://itcorp.com/')
      expect(monkey.result.sort[0..1]).to eq([['a', 4], ['actively', 1]])
    end
  end
end
