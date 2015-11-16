class Threat < ActiveRecord::Base
  CATEGORY = {
    :spoofing=>'s',
    :tampering=>'t',
    :repudiation=>'r',
    :information=>'i',
    :dos=>'d',
    :elevation=>'e'
   }

  before_destroy :check_for_risks
  has_many :mitigations, dependent: :destroy
  has_many :risks
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :description, length: { in: 5..256 }
  validates :category, inclusion: { :in=> Threat::CATEGORY.values}
  def check_for_risks
    if self.risks.size > 0
      self.errors[:base] << "You cannot destroy threat while have risks"
      return false
    else
      return true
    end
  end
end
