class RepositoryLocation < Sequel::Model(:repository_location)
  include ASModel
  corresponds_to JSONModel(:repository_location)

  set_model_scope :global
end
