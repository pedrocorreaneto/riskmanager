class Threat < ActiveRecord::Base
  CATEGORY = {
    :spoofing=>'s',
    :tampering=>'t',
    :repudiation=>'r',
    :information=>'i',
    :dos=>'d',
    :elevation=>'e'
   }

  has_many :solutions, dependent: :destroy
  has_many :requirements
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :description, length: { in: 5..256 }
  validates :category, inclusion: { :in=> Threat::CATEGORY.values}
  before_destroy :check_for_requirements
  def check_for_requirements
    if self.requirements.size > 0
      self.errors[:base] << "You cannot destroy threat while have requirements"
      return false
    else
      return true
    end
  end
end
