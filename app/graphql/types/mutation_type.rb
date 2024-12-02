module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :test_field, String, null: false,
                               description: 'An example field added by the generator'
    def test_field
      'Hello World'
    end

    # field :create_author, Types::AuthorType, null: true, description: "Create an Author" do
    #   argument :first_name, String, required: false
    #   argument :last_name, String, required: false
    #   argument :yob, Integer, required: false
    #   argument :is_alive, Boolean, required: false
    # end
    # def create_author(first_name:, last_name:, yob:, is_alive:)
    #   Author.create(first_name: first_name, last_name: last_name, yob: yob, is_alive: is_alive)
    # end

    field :create_author, Types::AuthorType, mutation: Mutations::CreateAuthor
    # 返り値がboolean
    field :update_author, Boolean, null: false, description: "update an author" do
      argument :author, Types::AuthorInputType, required: true
    end

    def update_author(author:)
      # existing = Author.where(id: author[:id]).first
      # existing&.update(author.to_h)
      target_author = Author.find(author[:id])
      target_author.update(author.to_h)

    end

    field :delete_author, Boolean, null: false, description: "Delete an author" do
      argument :id, ID, required: true
    end

    def delete_author(id:)
      Author.find(id).destroy
    end
  end
end
