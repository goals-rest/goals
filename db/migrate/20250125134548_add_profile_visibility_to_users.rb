class AddProfileVisibilityToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :profile_visibility, :integer, default: 0
  end
end
