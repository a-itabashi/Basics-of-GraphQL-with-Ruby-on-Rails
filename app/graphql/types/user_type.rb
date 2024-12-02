class Types::UserType < Types::BaseObject
  description 'A User'

  field :id, ID, null: false
  field :email, String, null: true
  field :is_superadmin, Boolean, null: false

  # self.visible?(context)が実行されるタイミングは、GraphQLのクエリがサーバーに送信されたとき。
  # def self.visible?(context)
  def visible?(context)
    !!context[:current_user]
  end
end
