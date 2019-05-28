class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.text :description
      t.string :job_title
      t.string :location
      t.string :total_compensation
      t.string :years_experience
      t.string :education_degree
      t.boolean :visa_sponsor, default: false
      t.string :date_posted
      t.string :employment_type
      t.references :company, foreign_key: true
      t.timestamps
    end
  end
end
