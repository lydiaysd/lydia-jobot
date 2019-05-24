class UserIndustry < ApplicationRecord
  has_many :industries
  has_many :users
end
