class Mitigation < ActiveRecord::Base
  belongs_to :threat
  has_and_belongs_to_many :risks

  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :description, length: { minimum: 5 }
  validates :threat, presence: true
  validates :reference, :url => {:allow_blank => true}
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
