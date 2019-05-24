class CreateUserIndustries < ActiveRecord::Migration[5.2]
  def change
    create_table :user_industries do |t|
      t.references :user, foreign_key: true
      t.references :industry, foreign_key: true
      t.timestamps
    end
  end
end
