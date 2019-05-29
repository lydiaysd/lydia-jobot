class AddGuestUserToUserSkills < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_skills, :guest_user, foreign_key: true
  end
end
