require 'spec_helper'
require 'pet_rescue/listing_page_parser'

describe PetRescue::ListingPageParser do
  subject(:parser) { PetRescue::ListingPageParser.new }

  describe "#parse" do
    it "extracts the pet's name" do
      pet = parser.parse(read_fixture("wyatt.html"))

      expect(pet.name).to eq("Wyatt")
    end

    it "extracts the pet's size" do
      pet = parser.parse(read_fixture("wyatt.html"))

      expect(pet.size).to eq("Medium")
    end

    it "extracts the pet's gender" do
      pet = parser.parse(read_fixture("wyatt.html"))

      expect(pet.gender).to eq("Male")
    end

    it "extracts the pet's breed" do
      pet = parser.parse(read_fixture("wyatt.html"))

      expect(pet.breed).to eq("American Staffordshire Terrier Mix")
    end

    it "extracts the pet's age" do
      pet = parser.parse(read_fixture("wyatt.html"))

      expect(pet.age).to eq("3 months")
    end

    it "extracts the pet's location" do
      pet = parser.parse(read_fixture("wyatt.html"))

      expect(pet.location).to eq("New South Wales")
    end

    it "extracts whether the pet has been vaccinated" do
      pet = parser.parse(read_fixture("wyatt.html"))

      expect(pet.vaccinated?).to eq(true)
    end

    it "extracts whether the pet has been desexed" do
      pet = parser.parse(read_fixture("wyatt.html"))

      expect(pet.desexed?).to eq(true)
    end

    it "extracts a biography of the pet" do
      pet = parser.parse(read_fixture("wyatt.html"))

      expect(pet.biography).to eq(<<-BIO.strip.gsub(/\s+/, ' '))
        This little guy is a real cuddle bug. He will be energetic and strong,
        so obedience is a must, with this he will become a wonderful calm and
        confident member of the family and will love spending time indoors as
        well as outdoors.  He will be ideal for an active family with or
        without children. A good size yard is preferable but not essential, a
        smaller yard is ok as long as you make time for daily walks and play
        time. He loves water and toys and get along very well with all his
        puppy playmates. Meal time is one of his favorite time of day and he is
        happy to share with all his puppy friends.
      BIO
    end

    it "extracts the name of the pet rescue group" do
      pet = parser.parse(read_fixture("wyatt.html"))

      expect(pet.rescue_group).to eq("J&J Rescue")
    end

    it "extracts the URL of a small photo of the pet" do
      pet = parser.parse(read_fixture("wyatt.html"))

      expect(pet.small_photo_url).to eq("http://cdn.petrescue.com.au/uploads/pet_photos/2014/9/22/319860_a1ce4_340x340_004c5.jpg")
    end

    it "extracts the URL of a large photo of the pet" do
      pet = parser.parse(read_fixture("wyatt.html"))

      expect(pet.large_photo_url).to eq("http://cdn.petrescue.com.au/uploads/pet_photos/2014/9/22/319860_a1ce4_900x900_004c5.jpg")
    end

    it "extracts the pet adoption fee for the pet" do
      pet = parser.parse(read_fixture("wyatt.html"))

      expect(pet.adoption_fee).to eq(500)
    end

    it "handles the absence of a '$' in the pet adoption fee" do
      pet = parser.parse(read_fixture("muttley.html"))

      expect(pet.adoption_fee).to eq(300)
    end

    it "extracts the adoption process for the pet when present" do
      pet = parser.parse(read_fixture("mau.html"))

      expect(pet.adoption_process).to eq(<<-PROCESS.strip.gsub(/\s+/, ' '))
         For more information about Mau please contact Sydney Dogs and Cats Home
      PROCESS
    end

    it "handles the absence of a pet adoption process " do
      pet = parser.parse(read_fixture("wyatt.html"))

      expect(pet.adoption_process).to eq(nil)
    end

    it "extracts a contact name for the pet" do
      pet = parser.parse(read_fixture("wyatt.html"))

      expect(pet.contact_name).to eq("Donna")
    end

    it "handles the absence of a contact name" do
      pet = parser.parse(read_fixture("mau.html"))

      expect(pet.contact_name).to eq(nil)
    end

    it "extracts a contact number for the pet" do
      pet = parser.parse(read_fixture("wyatt.html"))

      expect(pet.contact_number).to eq("0410510308")
    end

    it "returns nil when a contact number is not specified" do
      pet = parser.parse(read_fixture("mau.html"))

      expect(pet.contact_number).to eq(nil)
    end
  end
end
