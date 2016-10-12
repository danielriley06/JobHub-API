class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :title
      t.string :url
      t.string :phase
      t.string :salary
      t.string :location
      t.string :contact_name
      t.string :contact_email
      t.string :notes
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
