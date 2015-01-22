require 'spec_helper'
require 'pet_rescue/search_results_page'

describe PetRescue::SearchResultsPage do
  describe "#listing_pages" do
    it "is a collection of listing pages linked to from the page" do
      document = read_fixture("dog_search_first_page.html")
      page = PetRescue::SearchResultsPage.new(document)

      expect(page.listing_pages.size).to eq(48)
      expect(page.listing_pages.all? { |listing_page|
        listing_page.is_a?(PetRescue::ListingPage)
      }).to eq(true)
    end
  end

  describe "#has_next_page?" do
    it "is true when the page is not the last page of search results" do
      document = read_fixture("dog_search_first_page.html")
      page = PetRescue::SearchResultsPage.new(document)

      expect(page.has_next_page?).to eq(true)
    end

    it "is false when the page is the last page of search results" do
      document = read_fixture("dog_search_last_page.html")
      page = PetRescue::SearchResultsPage.new(document)

      expect(page.has_next_page?).to eq(false)
    end
  end
end
