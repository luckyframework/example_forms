class CreateNeighborhoods::V20220508213229 < Avram::Migrator::Migration::V1
  def migrate
    # Learn about migrations at: https://luckyframework.org/guides/database/migrations
    create table_for(Neighborhood) do
      primary_key id : Int64
      add_timestamps
      add name : String, case_sensitive: false
      add hoa_fee : Int32, default: 0
      add lid_fee : Int32, default: 0
      add sid_fee : Int32, default: 0
      add master_plan : Bool, default: false
      add amenities : Array(String), default: [] of String
    end
  end

  def rollback
    drop table_for(Neighborhood)
  end
end
