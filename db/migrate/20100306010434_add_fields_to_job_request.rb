class AddFieldsToJobRequest < ActiveRecord::Migration
  def self.up
    add_column :job_requests, :organisation_name, :string
    add_column :job_requests, :phone_number, :string
    add_column :job_requests, :email_address, :string
    add_column :job_requests, :helpee_name, :string
  end

  def self.down
    remove_column :job_requests, :phone_number
    remove_column :job_requests, :organisation_name
    remove_column :job_requests, :email_address
    remove_column :job_requests, :helpee_name
  end
end
