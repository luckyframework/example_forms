class Neighborhood < BaseModel
  table do
    column name : String
    column hoa_fee : Int32 = 0
    column lid_fee : Int32 = 0
    column sid_fee : Int32 = 0
    column master_plan : Bool = false
    column amenities : Array(String) = [] of String
    has_many houses : House
  end
end
