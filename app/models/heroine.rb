class Heroine < ApplicationRecord
    belongs_to :power

    validates :name, presence: true
    validates :super_name, presence: true
    validates :super_name, uniqueness: true
end
