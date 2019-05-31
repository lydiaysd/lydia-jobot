require 'open-uri'

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_industries
  has_many :industries, through: :user_industries
  has_many :user_skills
  has_many :skills, through: :user_skills
  has_many :saved_jobs
  has_many :jobs, through: :saved_jobs
  has_many :user_languages
  has_many :languages, through: :user_languages

  def reject_unavailable_saved_jobs
    saved_jobs.map(&:job).reject do |job|
      begin
        open(job.url)
        return false
      rescue => e
        return true
      end
    end
  end
end
