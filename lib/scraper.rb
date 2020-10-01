require_relative './spider.rb'

class Scraper < Spider
  # Initialize with scraper name and url
  # Create an instance from the Spider class

  # Create movie title validator
  # is_title_valid?(title)

  # Generate movie URL
  # generate_url(movie_title)

  # Check movie availability
  # is_url_valid?(movie_url)

  # Create scrape method
    # Show loader (#scraping)
    # Scrape for audience reviews
    # scraper.scrape('.mop-audience-reviews__reviews-wrap .mop-audience-reviews__review--comment')
    # Save result in audience_reviews array, if no results leave as empty
    # Scrape for critic reviews
    # scraper.scrape('.top_critic p')
    # Save result in critic_reviews array, if no results return empty array
    # return an Hash: reviews = { audience_reviews: audience_reviews, critic_reviews: critic_reviews }

  # Scraping
    # scrape(movie_title)
    # return "Please wait while we scrape rotten tomatoes for reviews on #{movie_title}"
end
