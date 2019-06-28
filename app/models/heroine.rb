class Heroine < ApplicationRecord
  belongs_to :power
  validates :name, :super_name, presence: true
  validates_uniqueness_of :super_name
end
