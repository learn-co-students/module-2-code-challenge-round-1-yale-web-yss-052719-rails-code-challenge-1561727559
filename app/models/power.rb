class Power < ApplicationRecord
  has_many :heroines
  validates :name, :description, presence: true
  #need to add only one validates
end
