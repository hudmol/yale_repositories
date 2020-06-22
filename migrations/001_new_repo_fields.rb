require 'db/migrations/utils'

Sequel.migration do

  up do
    alter_table(:repository) do
      add_column(:libcal_id, String, :null => true)
      add_column(:latitude, String, :null => true)
      add_column(:longitude, String, :null => true)
    end
  end

end

