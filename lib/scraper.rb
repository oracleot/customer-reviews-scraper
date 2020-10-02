require_relative './spider.rb'

class Scraper < Spider
  def initialize(title_url = 'billy_the_kid_2007')
    @title_url = title_url
  end

  def title_valid?(title)
    !title.empty? && title.index(/[$.,|#]/).nil?
  end

  def generate_url(title)
    title.gsub(' ', '_')
  end

  def url_valid?(movie_url)
    scrape_movie(movie_url) != 'OpenURI Error'
  end

  def scrape_movie(movie_url)
    critic_reviews = generate_arr(CRITIC_REVIEW_SELECTOR, movie_url.to_s)
    audience_reviews = generate_arr(AUDIENCE_REVIEW_SELECTOR, movie_url.to_s)
    { critic_reviews: critic_reviews, audience_reviews: audience_reviews }
  rescue OpenURI::HTTPError
    'OpenURI Error'
  end
end
