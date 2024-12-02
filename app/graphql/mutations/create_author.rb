module Mutations
  class CreateAuthor < GraphQL::Schema::Mutation
    null true

    # argument :first_name, String, required: false
    # argument :last_name, String, required: false
    # argument :yob, Integer, required: false
    # argument :is_alive, Boolean, required: false

    # def resolve(first_name:, last_name:, yob:, is_alive:)
    #   Author.create(first_name: first_name, last_name: last_name, yob: yob, is_alive: is_alive)
    # end

    argument :author, Types::AuthorInputType, required: true

    def resolve(author:)
      Author.create(author.to_h)
    end
  end
end
