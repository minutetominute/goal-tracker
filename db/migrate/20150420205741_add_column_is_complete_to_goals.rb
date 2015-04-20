class AddColumnIsCompleteToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :is_complete, :boolean
    change_column :goals, :is_complete, :boolean, null: false
  end
end
