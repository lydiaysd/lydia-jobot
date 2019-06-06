class Job < ApplicationRecord
  has_many :job_skills
  has_many :job_languages
  has_many :saved_jobs, dependent: :destroy
  has_many :users, through: :saved_jobs
  has_many :skills, through: :job_skills
  has_many :languages, through: :job_languages
  belongs_to :company

  include PgSearch
  pg_search_scope :search_by_description,
    against: [ :description ],
    using: {
      tsearch: { prefix: true }
    }
  pg_search_scope :search_by_title_and_location,
    against: [:job_title, :location],
    using: {
      tsearch: { prefix: true }
    }
  pg_search_scope :search_by_employment_type,
  against: [:employment_type],
  using: {
    tsearch: { prefix: true }
  }

  def score(user)
    score = 2 # 1 for location and 1 for job title
    score += 1 if total_compensation.to_i >= user.total_compensation.to_i
    score += 1 if years_experience.to_i <= user.years_experience.to_i
    score += 1 if Job.search_by_description(user.education_degree).include?(self)
    score += visa_sponsor == user.visa_sponsor ? 1 : 0
    score += 1 if Job.search_by_employment_type(user.employment_type).include?(self)
    score += 1 if user.date_posted != nil

    # if user.date_posted
    #   score += 1
    # else
    #   score += date_posted > Date.today - 2.weeks ? 1 : 0
    # end

    user.skills.each do |s|
      score += 1 if Job.search_by_description(s.name).include?(self)
    end
    user.languages.each do |l|
      score += 1 if Job.search_by_description(l.name).include?(self)
    end
    user.industries.each do |i|
      score += 1 if Job.search_by_description(i.name).include?(self)
    end
    score
  end

  def percentage(user)
    (score(user).fdiv(7 + user.skills.size + user.languages.size + user.industries.size) * 100).round(0)
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
