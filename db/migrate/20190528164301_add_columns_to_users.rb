class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :job_title, :string
    add_column :users, :location, :string
    add_column :users, :total_compensation, :string
    add_column :users, :years_experience, :string
    add_column :users, :education_degree, :string
    add_column :users, :visa_sponsor, :boolean, default: false
    add_column :users, :date_posted, :boolean
    add_column :users, :employment_type, :string
  end
end
