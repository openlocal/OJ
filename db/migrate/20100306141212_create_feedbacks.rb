class CreateFeedbacks < ActiveRecord::Migration
  def self.up
    create_table :feedbacks do |t|
      t.references :job_request
      t.references :help_offer
      t.integer :rating
      t.text :notes
      t.integer :duration

      t.timestamps
    end
  end

  def self.down
    drop_table :feedbacks
  end
end
