class AddGuestUserToSavedJobs < ActiveRecord::Migration[5.2]
  def change
    add_reference :saved_jobs, :guest_user, foreign_key: true
  end
end
