class EnableExtensions::V00000000000001 < Avram::Migrator::Migration::V1
  def migrate
    enable_extension "citext"
    enable_extension "pgcrypto"
  end

  def rollback
    disable_extension "pgcrypto"
    disable_extension "citext"
  end
end
