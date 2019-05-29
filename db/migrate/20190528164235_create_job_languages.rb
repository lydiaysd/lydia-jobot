class CreateJobLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :job_languages do |t|
      t.references :job, foreign_key: true
      t.references :language, foreign_key: true
    end
  end
end
