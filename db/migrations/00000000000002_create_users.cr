class CreateUsers::V00000000000002 < Avram::Migrator::Migration::V1
  def migrate
    create table_for(User) do
      primary_key id : Int64
      add_timestamps
      add email : String, unique: true, case_sensitive: false
      add encrypted_password : String
    end
  end

  def rollback
    drop table_for(User)
  end
end
