class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :body, null: false
      t.integer :user_id, null: false, index: true
      t.boolean :privacy, default: false

      t.timestamps null: false
    end
  end
end
