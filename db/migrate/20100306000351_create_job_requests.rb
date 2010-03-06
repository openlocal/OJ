class CreateJobRequests < ActiveRecord::Migration
  def self.up
    create_table :job_requests do |t|
      t.string :title
      t.text :description
      t.text :location
      t.datetime :start_at
      t.datetime :end_at
      t.integer :duration
      t.string :status
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :job_requests
  end
end
