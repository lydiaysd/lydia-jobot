class AddUrlToJob < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :url, :string
  end
end
