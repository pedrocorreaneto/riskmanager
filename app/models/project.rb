class Project < ActiveRecord::Base
  has_many :requirements, dependent: :destroy
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :description, length: { in: 5..256 }
end
