class Job < ApplicationRecord
  has_many :job_skills
  has_many :saved_jobs
  has_many :users, through: :saved_jobs
  has_many :skills, through: :job_skills
end

# add job id and skill id to job_skills table (done)
# remove skills from jobs table (done)
# create simple form for a job (this will be the chat)
# scrape the web for industries, job roles, languages, etc. and seed
# conect the seed searches to simple form

# watir gem - can render the divs
# mechanize - can simulate an user log in

# should we have a search table? every user has a search and that search can be used by many users (faster scraping )
