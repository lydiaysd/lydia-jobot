class AddGuestUserToUserIndustries < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_industries, :guest_user, foreign_key: true
  end
end
