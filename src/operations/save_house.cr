class SaveHouse < House::SaveOperation
  # To save user provided params to the database, you must permit them
  # https://luckyframework.org/guides/database/validating-saving#perma-permitting-columns
  permit_columns blurb, bedrooms, bathrooms, living_sqft, lot_sqft, property_type,
    active_listing, status, year_built, price, tags

  attribute street : String = record.try(&.address.street)
  attribute street_2 : String = record.try(&.address.street_2)
  attribute city : String = record.try(&.address.city)
  attribute state : String = record.try(&.address.state)
  attribute zip_code : String = record.try(&.address.zip_code)

  before_save :setup_address

  private def setup_address
    address.value = House::Address.from_json({
      "street"   => street.value,
      "street_2" => street_2.value,
      "city"     => city.value,
      "state"    => state.value,
      "zip_code" => zip_code.value,
    }.to_json)
  end
end
