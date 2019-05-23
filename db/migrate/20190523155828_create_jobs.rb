class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :location
      t.integer :total_compensation
      t.string :skills
      t.integer :years_experience
      t.boolean :visa, default: false
      t.date :date_posted
      t.timestamps
    end
  end
end
