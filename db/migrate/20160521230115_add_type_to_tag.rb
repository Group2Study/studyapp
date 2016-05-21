class AddTypeToTag < ActiveRecord::Migration
  def change
    add_reference :tags, :tag_type, index: true

  end
end
