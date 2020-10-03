require_relative './spider.rb'

class Scraper < Spider
  attr_reader :default_title

  def initialize(default_title = 'billy the kid 2007')
    @default_title = default_title
  end

  public

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
    critic_reviews = get_reviews(CRITIC_REVIEW_SELECTOR, movie_url)
    audience_reviews = get_reviews(AUDIENCE_REVIEW_SELECTOR, movie_url)
    { critic_reviews: critic_reviews, audience_reviews: audience_reviews }
  rescue OpenURI::HTTPError
    'OpenURI Error'
  end

  private

  def get_reviews(selector, movie_url)
    return generate_arr(selector, movie_url.to_s)
  end
end
