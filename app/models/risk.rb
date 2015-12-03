class Risk < ActiveRecord::Base
  belongs_to :project
  belongs_to :threat
  has_and_belongs_to_many :mitigations
  validates :project, presence: true
  validates_uniqueness_of :threat, scope: :project
end
