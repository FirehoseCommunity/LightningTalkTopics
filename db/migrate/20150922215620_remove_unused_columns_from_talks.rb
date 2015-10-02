class RemoveUnusedColumnsFromTalks < ActiveRecord::Migration
  def change
    remove_column :talks, :is_assigned, :string
    remove_column :talks, :assigned_to, :string
  end
end
