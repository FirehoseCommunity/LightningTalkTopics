class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|

      t.string :topic
      t.text :description
      t.boolean :is_assigned, default: false, null: false

      t.timestamps null: false
    end
  end
end
