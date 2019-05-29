class Company < ApplicationRecord
  validates :name, presence: true
  has_many :jobs, dependent: :destroy
  mount_uploader :logo, PhotoUploader
end
