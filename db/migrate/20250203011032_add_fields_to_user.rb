class AddFieldsToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :platform_admin, :boolean, default: false
  end
end
