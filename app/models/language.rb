class Language < ApplicationRecord
  has_many :user_languages
  has_many :users, through: :user_languages
  has_many :job_languages
  has_many :jobs, through: :job_languages
end
