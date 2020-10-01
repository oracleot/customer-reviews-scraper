require 'nokogiri'
require 'open-uri'
require_relative '../lib/constants.rb'

class Spider
  def initialize(url = 'billy_the_kid_2007')
    endpoint_url = (BASE_MOVIE_URL+url).to_s
    @doc = Nokogiri::HTML(URI.open(endpoint_url))
  end

  def scrape(selector)
    @doc.css(selector).to_a
  end
end
