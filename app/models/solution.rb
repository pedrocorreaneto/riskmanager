class Solution < ActiveRecord::Base
  belongs_to :threat
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :description, length: { in: 5..256 }
  validates :threat, presence: true
end
