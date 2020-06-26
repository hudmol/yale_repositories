require 'db/migrations/utils'

Sequel.migration do

  up do
    create_table(:repository_location) do
      primary_key :id
      Integer :lock_version, :default => 0, :null => false

      Integer :repository_id, :null => false

      String :address_1, :null => true
      String :address_2, :null => true
      String :address_3, :null => true
      String :city, :null => true
      String :region, :null => true
      String :country, :null => true
      String :post_code, :null => true

      String :latitude, :null => true
      String :longitude, :null => true

      TextField :access_information, :null => true

      String :libcal_id, :null => true

      apply_mtime_columns
    end

    alter_table(:repository_location) do
      add_foreign_key([:repository_id], :repository, :key => :id)
    end
  end

end

