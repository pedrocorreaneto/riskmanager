class Threat < ActiveRecord::Base
  CATEGORY = {
    :spoofing=>'s',
    :tampering=>'t',
    :repudiation=>'r',
    :information=>'i',
    :dos=>'d',
    :elevation=>'e'
   }

  has_many :solutions
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :description, length: { in: 5..256 }
  validates :category, inclusion: { :in=> Threat::CATEGORY.values}

end
