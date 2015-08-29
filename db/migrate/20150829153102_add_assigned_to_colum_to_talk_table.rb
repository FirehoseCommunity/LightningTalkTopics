class AddAssignedToColumToTalkTable < ActiveRecord::Migration
  def change
    add_column :talks, :assigned_to, :integer
  end
end
