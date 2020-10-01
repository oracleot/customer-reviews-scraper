require_relative '../lib/spider.rb'

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
