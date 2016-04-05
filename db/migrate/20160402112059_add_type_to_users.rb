class AddTypeToUsers < ActiveRecord::Migration
  def up
    add_column :users, :type, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :referrer, :string
    add_column :users, :contact_number, :string
  end
end
