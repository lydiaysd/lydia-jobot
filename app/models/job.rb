class Job < ApplicationRecord
  has_many :job_skills
  has_many :saved_jobs
  has_many :users, through: :saved_jobs
  has_many :skills, through: :job_skills
end
