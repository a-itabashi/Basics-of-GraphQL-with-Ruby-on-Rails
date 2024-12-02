class Types::UserType < Types::BaseObject
  description 'A User'

  field :id, ID, null: false
  field :email, String, null: true
  field :is_superadmin, Boolean, null: false
end
