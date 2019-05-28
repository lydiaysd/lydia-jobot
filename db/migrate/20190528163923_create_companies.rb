class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :number_of_employees
      t.string :company_type
    end
  end
end
