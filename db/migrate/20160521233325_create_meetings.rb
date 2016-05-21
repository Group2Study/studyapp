class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.date :date
      t.references :group, index: true

      t.timestamps null: false
    end
  end
end
