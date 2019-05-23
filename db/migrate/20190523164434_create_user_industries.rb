class CreateUserIndustries < ActiveRecord::Migration[5.2]
  def change
    create_table :user_industries do |t|

      t.timestamps
    end
  end
end
