class AddAdministrableToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :administrable, :boolean
  end
end
