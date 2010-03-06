class CreateHelpOffers < ActiveRecord::Migration
  def self.up
    create_table :help_offers do |t|
      t.references :user
      t.references :job_request
      t.text :comment
      t.boolean :accepted
      t.text :response

      t.timestamps
    end
  end

  def self.down
    drop_table :help_offers
  end
end
