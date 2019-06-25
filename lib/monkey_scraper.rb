require 'nokogiri'
require 'open-uri'
require 'pp'

# Scrapes words off the site
class MonkeyScrapper
  attr_reader :result

  def scrape(site)
    html = Nokogiri::HTML(open(site))

    # Shortlist only words that contain letters
    text = html.at('body').inner_text.scan(/[a-z]+/i)

    # Sanity checks
    # -------------

    # pp text.length, text.uniq.length, text.uniq.sort[0..10]

    # -------------

    # Produce list
    @result = frequencies(text)
  end

  # Find and sort the most frequent words
  def frequencies(words)
    Hash[
      words.group_by(&:downcase).map do |word, instances|
        [word, instances.length]
      end.sort_by(&:first)
    ]
  end
end
