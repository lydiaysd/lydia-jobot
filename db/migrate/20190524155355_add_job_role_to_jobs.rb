class AddJobRoleToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :job_role, :string
  end
end
