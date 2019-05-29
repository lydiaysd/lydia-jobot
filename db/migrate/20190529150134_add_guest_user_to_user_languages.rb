class AddGuestUserToUserLanguages < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_languages, :guest_user, foreign_key: true
  end
end
