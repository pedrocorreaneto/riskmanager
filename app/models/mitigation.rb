class Mitigation < ActiveRecord::Base
  belongs_to :threat
  has_and_belongs_to_many :risks

  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :description, length: { in: 5..256 }
  validates :threat, presence: true

  before_destroy :check_for_risks
  def check_for_risks
    if self.risks.size > 0
      self.errors[:base] << "You cannot destroy mitigation while have risks"
      return false
    else
      return true
    end
  end
end
