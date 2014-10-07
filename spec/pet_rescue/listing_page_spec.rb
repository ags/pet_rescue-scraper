require 'spec_helper'
require 'pet_rescue/listing_page'

describe PetRescue::ListingPage do
  describe "#pet_name" do
    it "exposes the pet's name" do
      page = PetRescue::ListingPage.new(read_fixture("wyatt.html"))

      expect(page.pet_name).to eq("Wyatt")
    end
  end

  describe "#pet_size" do
    it "exposes the pet's size" do
      page = PetRescue::ListingPage.new(read_fixture("wyatt.html"))

      expect(page.pet_size).to eq("Medium")
    end
  end

  describe "#pet_gender" do
    it "exposes the pet's gender" do
      page = PetRescue::ListingPage.new(read_fixture("wyatt.html"))

      expect(page.pet_gender).to eq("Male")
    end
  end

  describe "#pet_breed" do
    it "exposes the pet's breed" do
      page = PetRescue::ListingPage.new(read_fixture("wyatt.html"))

      expect(page.pet_breed).to eq("American Staffordshire Terrier Mix")
    end
  end

  describe "#pet_age" do
    it "exposes the pet's age" do
      page = PetRescue::ListingPage.new(read_fixture("wyatt.html"))

      expect(page.pet_age).to eq("3 months")
    end
  end

  describe "#pet_location" do
    it "exposes the pet's location" do
      page = PetRescue::ListingPage.new(read_fixture("wyatt.html"))

      expect(page.pet_location).to eq("New South Wales")
    end
  end

  describe "#pet_vaccinated" do
    it "exposes whether the pet has been vaccinated" do
      page = PetRescue::ListingPage.new(read_fixture("wyatt.html"))

      expect(page.pet_vaccinated?).to eq(true)
    end
  end

  describe "#pet_desexed" do
    it "exposes whether the pet has been desexed" do
      page = PetRescue::ListingPage.new(read_fixture("wyatt.html"))

      expect(page.pet_desexed?).to eq(true)
    end
  end

  describe "#pet_biography" do
    it "exposes a biography of the pet" do
      page = PetRescue::ListingPage.new(read_fixture("wyatt.html"))

      expect(page.pet_biography).to eq(<<-BIO.strip.gsub(/\s+/, ' '))
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
  end

  describe "#pet_rescue_group" do
    it "exposes the name of the pet rescue group" do
      page = PetRescue::ListingPage.new(read_fixture("wyatt.html"))

      expect(page.pet_rescue_group).to eq("J&J Rescue")
    end
  end

  describe "#pet_small_photo_url"  do
    it "exposes the URL of a small photo of the pet" do
      page = PetRescue::ListingPage.new(read_fixture("wyatt.html"))

      expect(page.pet_small_photo_url).to eq("http://cdn.petrescue.com.au/uploads/pet_photos/2014/9/22/319860_a1ce4_340x340_004c5.jpg")
    end
  end

  describe "#pet_large_photo_url" do
    it "exposes the URL of a large photo of the pet" do
      page = PetRescue::ListingPage.new(read_fixture("wyatt.html"))

      expect(page.pet_large_photo_url).to eq("http://cdn.petrescue.com.au/uploads/pet_photos/2014/9/22/319860_a1ce4_900x900_004c5.jpg")
    end
  end

  describe "#pet_adoption_fee" do
    it "exposes the pet adoption fee for the pet" do
      page = PetRescue::ListingPage.new(read_fixture("wyatt.html"))

      expect(page.pet_adoption_fee).to eq(500)
    end

    it "handles the absence of a '$' in the amount" do
      page = PetRescue::ListingPage.new(read_fixture("muttley.html"))

      expect(page.pet_adoption_fee).to eq(300)
    end
  end

  describe "#pet_adoption_process" do
    it "exposes the adoption process for the pet when present" do
      page = PetRescue::ListingPage.new(read_fixture("mau.html"))

      expect(page.pet_adoption_process).to eq(<<-PROCESS.strip.gsub(/\s+/, ' '))
        For more information about Mau please contact Sydney Dogs and Cats Home
      PROCESS
    end

    it "returns nil when the adoption process is unspecified" do
      page = PetRescue::ListingPage.new(read_fixture("wyatt.html"))

      expect(page.pet_adoption_process).to eq(nil)
    end
  end

  describe "#pet_contact_name" do
    it "exposes a contact name for the pet" do
      page = PetRescue::ListingPage.new(read_fixture("wyatt.html"))

      expect(page.pet_contact_name).to eq("Donna")
    end

    it "returns nil when a contact name is not specified" do
      page = PetRescue::ListingPage.new(read_fixture("mau.html"))

      expect(page.pet_contact_name).to eq(nil)
    end
  end

  describe "#pet_contact_number" do
    it "exposes a contact number for the pet" do
      page = PetRescue::ListingPage.new(read_fixture("wyatt.html"))

      expect(page.pet_contact_number).to eq("0410510308")
    end

    it "returns nil when a contact number is not specified" do
      page = PetRescue::ListingPage.new(read_fixture("mau.html"))

      expect(page.pet_contact_number).to eq(nil)
    end
  end
end
