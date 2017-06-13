class Permit < ApplicationRecord
  validates :permitName, presence: true
  validates :permitType, presence: true

  # has_many :precautions
  # has_many :protections
  # has_many :environments
end
