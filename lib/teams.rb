# your stand OO ruby class

class Teams
#    attr_accessor :id, :city, :conference, :division, :name

    @@all = []
    @@city = []
    @@conference = []
    @@division = []

    def initialize(attributes)
        attributes.each do |key, value| 
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
        end
        @@all << self
        @@city << self.city
        @@conference << self.conference
        @@division << self.division
    end

    def self.all
        @@all
    end

    def self.cities
        @@city
    end

    def self.conferences
        @@conference
    end

    def self.divisions
        @@division
    end
end