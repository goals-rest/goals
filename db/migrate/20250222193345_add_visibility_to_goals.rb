class AddVisibilityToGoals < ActiveRecord::Migration[8.1]
  def change
    add_column :goals, :visibility, :integer, default: 0
  end
end
