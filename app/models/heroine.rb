class Heroine < ApplicationRecord
    belongs_to :power
    validates :super_name, presence:true
end
