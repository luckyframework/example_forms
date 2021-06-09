class House < BaseModel
  avram_enum PropertyType do
    Apartment = 2
    Condo = 3
    Farm = 6
    LotLand = 8
    Mobile = 7
    MultiFamily = 5
    SingleFamily = 1
    TownHome = 4
  end

  avram_enum Status do
    ForSale
    Pending
    Forclosure
  end

  table do
    column blurb : String
    column address : JSON::Any = JSON::Any.new({} of String => JSON::Any)
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
  end

end