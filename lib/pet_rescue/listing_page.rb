module PetRescue
  # A listing page on petrescue.com.au
  class ListingPage
    attr_reader :id

    def initialize(id, parser)
      @id = id
      @url = "http://www.petrescue.com.au/listings/#{@id}"
      @parser = parser
    end

    def pet
      @parser.parse(open(@url))
    end
  end
end
