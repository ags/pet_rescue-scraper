require 'pet_rescue/scraper/version'
require 'pet_rescue/search_results_page'

module PetRescue
  module Scraper
    # A collection of dog listings on petrescue.com.au
    class DogListings
      include Enumerable

      def initialize(per_page: 48)
        @per_page = per_page
      end

      def each(&block)
        search_page = SearchResultsPage.from_url(first_page_url)

        loop do
          search_page.listing_pages.each(&block)

          break unless search_page.has_next_page?

          search_page = search_page.next_page
        end
      end

      private

      def first_page_url
        "http://www.petrescue.com.au/listings/dogs?per_page=#{@per_page}&page=1"
      end
    end
  end
end
