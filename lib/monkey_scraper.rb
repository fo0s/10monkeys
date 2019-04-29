require 'byebug'
require 'nokogiri'
require 'open-uri'
require 'pp'

class MonkeyScrapper
  attr_reader :result

  def monkey_scraper(site)

    html = Nokogiri::HTML(open site)

    # Shortlist only words that contain letters
    text = html.at('body').inner_text.scan(/[a-z]+/i)

    # Sanity checks
    # -------------

    # byebug
    # pp text.length, text.uniq.length, text.uniq.sort[0..10]

    # -------------

    # Produce list
    @result = frequencies(text)
  end

  # Find and sort the most frequent words
  def frequencies(words)
    Hash[
      words.group_by(&:downcase).map{ |word,instances|
        [word,instances.length]
      }.sort_by(&:last).reverse
    ]
  end

end