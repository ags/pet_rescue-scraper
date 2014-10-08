require 'nokogiri'
require 'pet_rescue/pet'

module PetRescue
  # Parses an HTML listing page from petrescue.com.au
  class ListingPageParser
    def parse(document)
      @document = Nokogiri::HTML(document)

      Pet.new(name: pet_name,
              size: pet_size,
              gender: pet_gender,
              breed: pet_breed,
              age: pet_age,
              location: pet_location,
              vaccinated: pet_vaccinated?,
              desexed: pet_desexed?,
              biography: pet_biography,
              rescue_group: pet_rescue_group,
              small_photo_url: pet_small_photo_url,
              large_photo_url: pet_large_photo_url,
              adoption_fee: pet_adoption_fee,
              adoption_process: pet_adoption_process,
              contact_name: pet_contact_name,
              contact_number: pet_contact_number)
    end

    def pet_name
      @document.at_css("#main h1").text.strip
    end

    def pet_size
      species.split(" ")[0]
    end

    def pet_gender
      species.split(" ")[1]
    end

    def pet_breed
      species.split(" ").drop(2).join(" ")
    end

    def pet_age
      @document.at_css("dd.age").text.strip
    end

    def pet_location
      @document.at_css(".located_in").text.strip.gsub("Located in ", "").strip
    end

    def pet_vaccinated?
      @document.at_css("dd.vaccinated").text.strip == "Yes"
    end

    def pet_desexed?
      @document.at_css("dd.desexed").text.strip == "Yes"
    end

    def pet_biography
      @document.at_css(".personality").text.strip
    end

    def pet_adoption_fee
      @document.at_css("dd.adoption_fee").text.strip.gsub("$", "").to_i
    end

    def pet_adoption_process
      node = @document.at_css(".adoption_process")
      node && node.text.strip
    end

    def pet_rescue_group
      @document.at_css("dd.fostered_by").text.strip
    end

    def pet_contact_name
      node = @document.at_css("dd.contact_name")
      node && node.text.strip
    end

    def pet_contact_number
      node = @document.at_css("dt.contact_number")
      node &&= node.next_element.children.first
      node && node.text.strip
    end

    def pet_small_photo_url
      photo_node && photo_node.at_css("img").attributes["src"].value
    end

    def pet_large_photo_url
      photo_node && photo_node.at_css("a").attributes["href"].value
    end

    private

    def photo_node
      @document.at_css("#featured_photo")
    end

    def species
      @document.at_css(".species").text.strip
    end
  end
end
