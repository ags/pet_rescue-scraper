require 'nokogiri'
require 'open-uri'
require 'pet_rescue/listing_page'
require 'pet_rescue/listing_page_parser'

module PetRescue
  # A page of search results on petrescue.com.au
  class SearchResultsPage
    def self.from_url(url)
      SearchResultsPage.new(open(url))
    end

    def initialize(document)
      @document = Nokogiri::HTML(document)
    end

    def listing_pages
      listing_ids.map do |id|
        parser = PetRescue::ListingPageParser.new
        ListingPage.new(id, parser)
      end
    end

    def has_next_page?
      !!next_page_href
    end

    def next_page
      url = "http://www.petrescue.com.au#{next_page_href}"
      SearchResultsPage.from_url(url)
    end

    private

    def next_page_href
      node = @document.at_css(".next a")
      node && node[:href]
    end

    def listing_ids
      @document
        .css(".listing .name a")
        .map { |node| Integer(node[:href].to_s.gsub("/listings/", "")) }
    end
  end
end
