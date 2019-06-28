class Heroine < ApplicationRecord
	belongs_to :power

	validates :name, :super_name, :power_id, presence: true
	validates :super_name, uniqueness: true

end
