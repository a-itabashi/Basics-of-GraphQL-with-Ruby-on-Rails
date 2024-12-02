module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false, description: 'An example field added by the generator' do
      argument :name, String, required: true
    end
    def test_field(name:)
      Rails.logger.info(context[:time])
      "Hello #{name}"
    end

    field :author, Types::AuthorType, null: true, description: 'Return one Author instance' do
      argument :id, ID, required: true
    end
    def author(id:)
      Author.find(id)
    end

    field :authors, [Types::AuthorType], null: false
    def authors
      Author.all
    end

    field :login, String, null: false, description: 'login a user' do
      argument :email, String, required: true
      argument :password, String, required: true
    end
    def login(email:, password:)
      user = User.find_by(email: email)&.authenticate(password)
      return unless user

      user.sessions.create.key
    end

    field :current_user, Types::UserType, null: true, description: "The currently logged in user"
    def current_user
      context[:current_user]
    end

    field :logout, Boolean, null: false, description: "Logout a user"
    def logout
      Session.where(id: context[:session_id]).destroy_all
      # true
    end
  end
end
