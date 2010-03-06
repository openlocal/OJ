class ChangeRequestTimesToDates < ActiveRecord::Migration
  def self.up
    remove_column :job_requests, :start_at, :end_at
    add_column :job_requests, :start_at, :date
    add_column :job_requests, :end_at, :date
  end

  def self.down
    remove_column :job_requests, :start_at, :end_at
    add_column :job_requests, :start_at, :datetime
    add_column :job_requests, :end_at, :datetime
  end
end
