class AddSpeakDateColumnToTalkTable < ActiveRecord::Migration
  def change
    add_column :talks, :speak_date, :date
  end
end
