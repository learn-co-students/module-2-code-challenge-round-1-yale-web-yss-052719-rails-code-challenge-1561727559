class Heroine < ApplicationRecord
    belongs_to :power

    validates :super_name, uniqueness: true

    def self.search(search)
        
        Power.all.each do |p|
            if p.name == search
                @temp = p.id
            end
        end

        if search && search != ""
            where("power_id = #{@temp}", "%#{search}%")
        else
          all
        end
    end

end
