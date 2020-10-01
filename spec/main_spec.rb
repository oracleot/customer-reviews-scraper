require_relative '../lib/spider.rb'
require_relative '../lib/scraper.rb'

describe Spider do
  let(:my_spider) { Spider.new('the_garden_left_behind') }

  describe '#scrape' do
    it 'returns an array of scraped data with a valid selector' do
      expect(my_spider.scrape(AUDIENCE_REVIEW_SELECTOR.to_s)).to be_an(Array)
    end

    it 'returns an array of scraped data with a valid selector' do
      expect(my_spider.scrape(CRITIC_REVIEW_SELECTOR.to_s)).to be_an(Array)
    end
  end
end

describe Scraper do
  let(:scraper) { Scraper.new }
  let(:movie1) { 'the boy in the garden' }
  let(:movie2) { 'the boy | in the garden' }
  let(:movie3) { 'village' }

  describe '#valid_title?' do
    it 'returns true if movie title is valid' do
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

    it 'does not alter movie titles with no spaces' do
      expect(scraper.generate_url(movie3)).to eql(movie3)
    end
  end
end
