class AddParentToTag < ActiveRecord::Migration
  def change
    add_reference :tags, :parent_tag, index: true
  end
end
