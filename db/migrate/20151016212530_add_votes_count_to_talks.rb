class AddVotesCountToTalks < ActiveRecord::Migration
  def change
    add_column :talks, :votes_count, :integer, default: 0
    Talk.find_each { |talk| Talk.reset_counters(talk.id, :votes) }
  end
end
