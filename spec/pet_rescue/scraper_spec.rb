require 'spec_helper'
require 'support/vcr'
require 'pet_rescue/scraper'

describe PetRescue::Scraper do
  it "can gather dog listing pages from multiple pages of search results" do
    VCR.use_cassette('dogs') do
      scraper = PetRescue::Scraper::DogListings.new(per_page: 48)

      listing_ids = scraper.take(49).map { |listing| listing.id }

      expect(listing_ids.size).to eq(49)
    end
  end
end
