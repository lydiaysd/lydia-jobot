class GuestUser < ApplicationRecord
  has_many :user_industries
  has_many :industries, through: :user_industries
  has_many :user_skills
  has_many :skills, through: :user_skills
  has_many :saved_jobs
  has_many :jobs, through: :saved_jobs
  has_many :user_languages
  has_many :languages, through: :user_languages
end
