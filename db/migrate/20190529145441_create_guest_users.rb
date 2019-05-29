class CreateGuestUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :guest_users do |t|
      t.string :name
      t.string :job_title
      t.string :location
      t.string :total_compensation
      t.string :years_experience
      t.string :education_degree
      t.boolean :visa_sponsor, default: false
      t.boolean :date_posted
      t.string :employment_type
      t.timestamps
    end
  end
end
