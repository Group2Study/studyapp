class CreateGroupMessages < ActiveRecord::Migration
  def change
    create_table :group_messages do |t|
      t.text :message
      t.references :group, index: true

      t.timestamps
    end
  end
end
