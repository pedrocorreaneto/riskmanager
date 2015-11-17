class Risk < ActiveRecord::Base
  belongs_to :project
  belongs_to :threat
  belongs_to :mitigation
  validates :project, presence: true
  validates_uniqueness_of :threat, scope: :project
end