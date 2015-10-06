class Solution < ActiveRecord::Base
  belongs_to :threat
  has_many :requirements

  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :description, length: { in: 5..256 }
  validates :threat, presence: true

  before_destroy :check_for_requirements
  def check_for_requirements
    if self.requirements.size > 0
      self.errors[:base] << "You cannot destroy solution while have requirements"
      return false
    else
      return true
    end
  end
end
