class AddUserIdColumnToTalk < ActiveRecord::Migration
  def change
    add_column :talks, :user_id, :integer
    add_index :talks, :user_id
  end
end
