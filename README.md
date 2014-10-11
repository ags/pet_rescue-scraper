# PetRescue::Scraper

A screen scraper for [petrescue.com.au](http://www.petrescue.com.au/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pet_rescue-scraper'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pet_rescue-scraper

## Usage

Currently only scraping dog listings is supported.

```ruby
require 'pet_rescue/scraper'

dog_listings = PetRescue::Scraper::DogListings.new
dog_listings.take(10).each do |listing_page|
  pet = listing_page.pet
  puts "#{pet.name} - #{pet.breed}"
end
```

## Contributing

1. Fork it ( https://github.com/ags/pet_rescue-scraper/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
