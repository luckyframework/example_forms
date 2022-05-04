class SaveHouse < House::SaveOperation
  # To save user provided params to the database, you must permit them
  # https://luckyframework.org/guides/database/validating-saving#perma-permitting-columns
  permit_columns blurb, bedrooms, bathrooms, living_sqft, lot_sqft, property_type,
    active_listing, status, year_built, price, tags

  attribute street : String
  attribute street_2 : String
  attribute city : String
  attribute state : String
  attribute zip_code : String

  before_save :setup_address

  before_save do
    puts "CHECKING TAGS BEFORE"
    pp tags.value
    pp params
    puts "*" * 50
  end

  private def setup_address
    address.value = JSON::Any.new({
      "street"   => JSON::Any.new(street.value),
      "street_2" => JSON::Any.new(street_2.value),
      "city"     => JSON::Any.new(city.value),
      "state"    => JSON::Any.new(state.value),
      "zip_code" => JSON::Any.new(zip_code.value),
    })
  end
end
