class ChangeDateFormatInMeetings < ActiveRecord::Migration
  def change
    change_column :meetings, :start_time, :time
    change_column :meetings, :end_time, :time
  end
end
