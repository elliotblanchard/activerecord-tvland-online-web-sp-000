class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows, through: :characters

    def full_name
        return "#{self.first_name} #{self.last_name}"
    end

    def list_roles
        self.shows.map.with_index { |show, index|
            "#{self.characters[index].name} - #{show.name}"
        }
    end
end