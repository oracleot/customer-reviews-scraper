require 'nokogiri'
require_relative '../lib/spider.rb'
require_relative '../lib/scraper.rb'

describe Spider do
  let(:my_spider) { Spider.new }

  describe '#generate_arr' do
    it 'returns an array of scraped data with a valid url' do
      expect(my_spider.generate_arr(CRITIC_REVIEW_SELECTOR, 'the_garden_left_behind')).to be_an(Array)
    end

    it 'raises an error with an invalid url' do
      expect { my_spider.generate_arr(CRITIC_REVIEW_SELECTOR, 'the_garden_lef_behind') }.to raise_error
    end
  end
end

describe Scraper do
  let(:scraper) { Scraper.new }
  let(:movie1) { 'the boy in the garden' }
  let(:movie_url_invalid) { 'the_boy_in_the_garden' }
  let(:movie_url_valid) { 'no_time_to_die_2020' }
  let(:movie2) { 'the boy | in the garden' }
  let(:movie3) { 'village' }

  describe '#title_valid?' do
    it 'returns true if movie title is valid' do
      expect(scraper.title_valid?(movie1)).to be true
    end

    it 'returns false if movie title is invalid' do
      expect(scraper.title_valid?(movie2)).not_to be true
    end
  end

  describe '#url_valid?' do
    it 'returns true if generated url is valid' do
      expect(scraper.title_valid?(movie1)).to be true
    end

    it 'returns false if movie title is invalid' do
      expect(scraper.title_valid?(movie2)).not_to be true
    end
  end

  describe '#generate_url' do
    it 'replaces whitespaces in a title with underscores' do
      expect(scraper.generate_url(movie1)).to eql('the_boy_in_the_garden')
    end

    it 'replaces whitespaces in a title with underscores' do
      expect(scraper.generate_url(movie1)).not_to eql(movie1)
    end

    it 'does not alter movie titles with no whitespaces' do
      expect(scraper.generate_url(movie3)).to eql(movie3)
    end
  end

  describe '#url_valid?' do
    it 'returns true if generated url is a valid movie url' do
      expect(scraper.url_valid?(movie_url_valid)).to be true
    end

    it 'returns false if generated url is an valid movie url' do
      expect(scraper.url_valid?(movie_url_invalid)).to be false
    end
  end

  describe '#scrape_movie' do
    it 'returns a Hash of reviews with a valid movie URL' do
      expect(scraper.scrape_movie('the_garden_left_behind')).to be_a(Hash)
    end

    it 'raises an error with an invalid movie URL' do
      expect(scraper.scrape_movie('damilola_oduronbi')).to eql('OpenURI Error')
    end
  end
end
