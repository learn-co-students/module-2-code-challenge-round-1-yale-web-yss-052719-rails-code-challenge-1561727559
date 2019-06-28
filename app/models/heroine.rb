class Heroine < ApplicationRecord
	belongs_to :power

	validates :name, :super_name, :power_id, presence: true
	validates :super_name, uniqueness: true

	def self.search(search)
		power = Power.find_by name: search
		if power
			where("power_id LIKE ?", "%#{power.id}%")
		else
			[]
		end
	end

end
