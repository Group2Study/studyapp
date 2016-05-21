class CreateGroupTags < ActiveRecord::Migration
  def change
    create_table :group_tags do |t|
      t.references :group, index: true
      t.references :tag, index: true

      t.timestamps
    end
  end
end
