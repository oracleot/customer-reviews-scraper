require 'nokogiri'
require 'open-uri'
require_relative '../lib/constants.rb'

class Spider
  def initialize(title_url)
    endpoint_url = (BASE_MOVIE_URL + title_url).to_s
    @doc = Nokogiri::HTML(URI.open(endpoint_url))
  end

  def scrape(selector)
    @doc.css(selector).to_a
  end
end
