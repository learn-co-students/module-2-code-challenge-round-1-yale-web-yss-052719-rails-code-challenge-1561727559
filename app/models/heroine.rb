class Heroine < ApplicationRecord
  belongs_to :power

  validates :super_name, uniqueness: true

  def self.search_for_power(search_result)
    if search_result != nil
      power_present = Power.find_by(name: search_result)
        if power_present != nil
          self.where(power_id: power_present)
        else
          return Heroine.all
        end
      else
        return Heroine.all
      end
  end
end
