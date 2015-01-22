require 'virtus'

module PetRescue
  # Model for a pet on petrescue.com.au
  class Pet
    include Virtus.model

    attribute :id,                String
    attribute :name,              String
    attribute :size,              String
    attribute :gender,            String
    attribute :breed,             String
    attribute :age,               String
    attribute :location,          String
    attribute :vaccinated,        Boolean
    attribute :desexed,           Boolean
    attribute :biography,         String
    attribute :adoption_fee,      Integer
    attribute :adoption_process,  String
    attribute :rescue_group,      String
    attribute :contact_name ,     String
    attribute :contact_number,    String
    attribute :small_photo_url,   String
    attribute :large_photo_url,   String
    attribute :rescued,           Boolean
  end
end
