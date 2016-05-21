class CreateMeetingTags < ActiveRecord::Migration
  def change
    create_table :meeting_tags do |t|
      t.references :meeting, index: true
      t.references :tag, index: true

      t.timestamps null: false
    end
  end
end
