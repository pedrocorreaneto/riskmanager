class Requirement < ActiveRecord::Base
  belongs_to :project
  belongs_to :threat
  belongs_to :solution
end
