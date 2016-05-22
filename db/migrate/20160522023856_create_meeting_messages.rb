class CreateMeetingMessages < ActiveRecord::Migration
  def change
    create_table :meeting_messages do |t|
      t.string :text
      t.references :meeting, index: true

      t.timestamps null: false
    end
  end
end
