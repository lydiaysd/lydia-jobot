class CreateSavedJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :saved_jobs do |t|
      t.references :user, foreign_key: true
      t.references :job, foreign_key: true

      t.timestamps
    end
  end
end
