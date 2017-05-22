class User < ApplicationRecord
  has_many :permits

  validates :name, presence: true
end
