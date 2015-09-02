class RemoveSpeakDateColumnToTalkTable < ActiveRecord::Migration
  def change
    remove_column :talks, :speak_date, :date
  end
end
