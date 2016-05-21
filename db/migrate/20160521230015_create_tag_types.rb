class CreateTagTypes < ActiveRecord::Migration
  def change
    create_table :tag_types do |t|
      t.string :name
      t.string :key

      t.timestamps null: false
    end
  end
end
