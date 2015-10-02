class AddAssigneeToTalks < ActiveRecord::Migration
  def change
    add_reference :talks, :assignee, index: true
    update "UPDATE talks SET assignee_id=(SELECT id FROM users WHERE first_name = split_part(assigned_to, ' ', 1) AND last_name LIKE split_part(assigned_to, ' ', 2) || '%' LIMIT 1)"
  end
end
