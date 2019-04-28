require "monkey_scraper"

describe "Monkey Scraper" do
    context "#connecting to site- " do
        it "can connect to the oldest active website on record" do
            monkey = MonkeyScrapper.new
            monkey.monkey_scraper('http://itcorp.com/')
            expect(monkey.result.sort[0..2]).to eq([["a", 4], ["actively", 1], ["also", 1]])
        end
    end
end