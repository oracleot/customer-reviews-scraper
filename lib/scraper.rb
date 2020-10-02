require_relative './spider.rb'

class Scraper < Spider
  def initialize(title_url = 'billy_the_kid_2007')
    @title_url = title_url
  end

  def title_valid?(title)
    !title.empty? && title.index(/[$.,|]/).nil?
  end

  def generate_url(title)
    title.gsub(' ', '_')
  end

  def url_valid?(movie_url)
    scrape_movie(movie_url) != 'OpenURI Error'
  end

  def scrape_movie(movie_url)
    begin
      generate_arr(CRITIC_REVIEW_SELECTOR, movie_url.to_s)
    rescue OpenURI::HTTPError
      'OpenURI Error'
    end
  end

  # Create scrape method
  # Show loader (#scraping)
  # Scrape for audience reviews
  # scraper.scrape('.mop-audience-reviews__reviews-wrap .mop-audience-reviews__review--comment')
  # Save result in audience_reviews array, if no results leave as empty
  # Scrape for critic reviews
  # scraper.scrape('.top_critic p')
  # Save result in critic_reviews array, if no results return empty array
  # return an Hash: reviews = { audience_reviews: audience_reviews, critic_reviews: critic_reviews }

  def scrape; end

  # Scraping
  # scrape(movie_title)
  # return "Please wait while we scrape rotten tomatoes for reviews on #{movie_title}"
end
