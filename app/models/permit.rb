class Permit < ApplicationRecord
  belongs_to :user

  validates :permitName, presence: true
  validates :permitType, presence: true
end
