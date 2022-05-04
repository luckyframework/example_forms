class AddressSerializer < BaseSerializer
  include JSON::Serializable

  property street : String
  property street_2 : String?
  property city : String
  property state : String
  property zip_code : String

  def render
    {
      street:   street,
      street_2: street_2,
      city:     city,
      state:    state,
      zip_code: zip_code,
    }
  end
end
