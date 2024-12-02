class Types::AuthorType < Types::BaseObject
  description 'One Author'

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

  field :errors, [Types::ErrorType], null: true
  def errors
    object.errors.map { |e| { field_name: e.attribute, errors: object.errors[e.attribute] } }
  end
end

class Types::AuthorInputType < GraphQL::Schema::InputObject
  graphql_name 'AuthorInputType'
  description 'All the attributes needed to create/update an author'

  argument :id, ID, required: false
  argument :first_name, String, required: false
  argument :last_name, String, required: false
  argument :yob, Integer, required: false
  argument :is_alive, Boolean, required: false
end
