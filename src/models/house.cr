class House < BaseModel
  enum PropertyType
    Apartment    = 2
    Condo        = 3
    Farm         = 6
    LotLand      = 8
    Mobile       = 7
    MultiFamily  = 5
    SingleFamily = 1
    TownHome     = 4
  end

  enum Status
    ForSale
    Pending
    Forclosure
  end

  struct Address
    include JSON::Serializable

    property street : String
    property street_2 : String?
    property city : String
    property state : String
    property zip_code : String
  end

  table do
    column blurb : String
    column address : House::Address, serialize: true
    column bedrooms : Int32
    column bathrooms : Float64
    column living_sqft : Int32
    column lot_sqft : Int64
    column property_type : House::PropertyType
    column active_listing : Bool = false
    column status : House::Status
    column year_built : Int16
    column price : Int64
    column tags : Array(String) = [] of String
    belongs_to neighborhood : Neighborhood
  end
end
