class Heroine < ApplicationRecord
    belongs_to :power

    validates :super_name, uniqueness: true

    def self.search(search)
        
        #relates power.name to power.id to use in search
        Power.all.each do |p|
            if p.name == search
                @temp = p.id
            end
        end

        #actual search
        if search && search != ""
            where("power_id = #{@temp}", "%#{search}%")
        else
          all
        end
    end

end
