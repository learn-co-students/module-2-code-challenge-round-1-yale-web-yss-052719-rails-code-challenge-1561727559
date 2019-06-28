class Heroine < ApplicationRecord
    belongs_to :power
    validates :super_name, uniqueness: true
    validates :name, :power_id, presence: true
end
