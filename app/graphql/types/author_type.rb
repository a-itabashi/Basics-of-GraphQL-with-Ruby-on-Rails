class Types::AuthorType < Types::BaseObject
  description "One Author"

  field :id, ID, null: false
  field :first_name, String, null: true
  field :last_name, String, null: true
  field :yob, Integer, null: false
  field :is_alive, Boolean, null: true
  field :created_at, GraphQL::Types::ISO8601Date, null: false
  field :full_name, String, null: true
  field :publication_years, [Integer], null: false

  # Custom Types
  # Types::CoordinatesType, null: false の場合、
  # coordinates フィールドは必ず Types::CoordinatesType のオブジェクトを返さなけばならない
  field :coordinates, Types::CoordinatesType, null: false

  def full_name
    "#{object.first_name} #{object.last_name}"
  end

end
