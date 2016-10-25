class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :jobtitle
      t.string :url
      t.string :phase
      t.string :salary
      t.string :city
      t.string :state
      t.string :contact_name
      t.string :contact_email
      t.string :status,  :null => false, :default => 'Saved'
      t.string :snippet
      t.string :notes
      t.string :jobkey
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
