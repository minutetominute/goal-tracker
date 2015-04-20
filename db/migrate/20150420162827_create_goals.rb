class CreateGoals < ActiveRecord::Migration

  def change
    create_table :goals do |t|
      t.text :body, null: false
      t.integer :author_id, null: false

      t.timestamps null: false
    end
    add_index :goals, :author_id
  end

end
