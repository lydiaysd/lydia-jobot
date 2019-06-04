class Job < ApplicationRecord
  has_many :job_skills
  has_many :job_languages
  has_many :saved_jobs
  has_many :users, through: :saved_jobs
  has_many :skills, through: :job_skills
  has_many :languages, through: :job_languages
  belongs_to :company


  include PgSearch
    pg_search_scope :search_by_description,
      against: [ :description ],
      using: {
        tsearch: { prefix: true } # <-- now `superman batm` will return something!
      }

  def score(user)
    score = 0
    score += 1 if job_title =~ /#{user.job_title}/
    score += 1 if location =~ /#{user.location}/
    score += 1 if total_compensation =~ /#{user.total_compensation}/
    score += 1 if years_experience || 0 <= user.years_experience.to_i
    score += 1 if education_degree =~ /#{Job.search_by_description(user.education_degree)}/
    score += 1 if visa_sponsor =~ /#{user.visa_sponsor}/
    score += 1 if date_posted =~ /#{user.date_posted}/
    score += 1 if employment_type =~ /#{user.employment_type}/

    user.skills.each do |s|
      score += 1 if Job.search_by_description(s.name) != nil
    end

    score += 1 if languages =~ /#{Job.search_by_description(user.languages)}/
    score += 1 if company.industries =~ /#{user.industries}/
    score
    # raise
  end
end

# add job id and skill id to job_skills table (done)
# remove skills from jobs table (done)
# create simple form for a job (done but needs better styling)
# scrape the web for industries, job roles, languages, etc. and seed (done but needs more scrapers)
# conect the seed searches to simple form (done, it is scraping from the controller)

# watir gem - can render the divs
# mechanize - can simulate an user log in

# should we have a search table? every user has a search and that search can be used by many users (faster scraping )
