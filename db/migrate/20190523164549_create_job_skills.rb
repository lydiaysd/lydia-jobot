class CreateJobSkills < ActiveRecord::Migration[5.2]
  def change
    create_table :job_skills do |t|

      t.timestamps
    end
  end
end
