require 'db/migrations/utils'

Sequel.migration do

  up do
    create_table(:repository_location) do
      primary_key :id
      Integer :lock_version, :default => 0, :null => false

      Integer :repository_id, :null => false

      TextField :address_1, :null => true
      TextField :address_2, :null => true
      TextField :address_3, :null => true
      TextField :city, :null => true
      TextField :region, :null => true
      TextField :country, :null => true
      TextField :post_code, :null => true

      TextField :latitude, :null => true
      TextField :longitude, :null => true

      TextField :libcal_id, :null => true

      apply_mtime_columns
    end

    alter_table(:repository_location) do
      add_foreign_key([:repository_id], :repository, :key => :id)
    end
  end

end

