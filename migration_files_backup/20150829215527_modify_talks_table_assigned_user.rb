class ModifyTalksTableAssignedUser < ActiveRecord::Migration
  def change
    change_column :talks, :assigned_to, :string
  end
end
