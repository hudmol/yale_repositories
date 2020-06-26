module RepositoryLocations

  def self.included(base)
    base.one_to_one :repository_location
    base.def_nested_record(:the_property => :location,
                           :contains_records_of_type => :repository_location,
                           :corresponding_to_association => :repository_location,
                           :is_array => false)
  end

end
