class AddColumnIsPrivateToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :is_private, :boolean
    change_column :goals, :is_private, :boolean, null: false
  end
end
