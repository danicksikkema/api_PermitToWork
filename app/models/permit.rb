class Permit < ApplicationRecord
  validates :permitName, presence: true
  validates :permitType, presence: true
end
