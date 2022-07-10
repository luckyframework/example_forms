class CreateHouses::V20220531210346 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(House) do
      primary_key id : Int64
      add_timestamps
      add blurb : String
      add address : JSON::Any, default: JSON::Any.new({} of String => JSON::Any)
      add bedrooms : Int32
      add bathrooms : Float64
      add living_sqft : Int32
      add lot_sqft : Int64
      add property_type : Int32 # Used as Enum
      add active_listing : Bool, default: false
      add status : Int32 # Used as Enum
      add year_built : Int16
      add price : Int64
      add tags : Array(String), default: [] of String
      add_belongs_to neighborhood : Neighborhood, on_delete: :cascade
    end
  end

  def rollback
    drop table_for(House)
  end
end
