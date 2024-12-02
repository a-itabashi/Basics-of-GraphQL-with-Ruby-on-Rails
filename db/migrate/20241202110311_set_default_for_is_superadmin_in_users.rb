class SetDefaultForIsSuperadminInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :is_superadmin, from: nil, to: false
  end
end
