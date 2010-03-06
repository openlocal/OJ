class AddRealNameToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :real_name, :string
  end

  def self.down
    remove_column :users, :real_names
  end
end
