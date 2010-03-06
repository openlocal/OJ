class AddDetailsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :skills, :string
    add_column :users, :reason, :string
    add_column :users, :my_job, :string
    add_column :users, :website, :string
    add_column :users, :about_me, :text
  end

  def self.down
    remove_column :users, :about_me
    remove_column :users, :website
    remove_column :users, :my_job
    remove_column :users, :reason
    remove_column :users, :skills
  end
end
