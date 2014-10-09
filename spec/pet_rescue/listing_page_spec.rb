require 'spec_helper'
require 'pet_rescue/listing_page'

describe PetRescue::ListingPage do
  describe "#pet" do
    it "passes the listing resource for the given ID to the given parser" do
      resource = spy(:resource)
      parser = spy(:parser)
      id = 123

      page = PetRescue::ListingPage.new(id, parser)

      allow(page).to receive(:open).and_return(resource)

      page.pet

      expect(parser).to have_received(:parse).with(resource)
    end
  end
end
