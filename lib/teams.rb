# your stand OO ruby class

class Teams
#    attr_accessor :id, :city, :conference, :division, :name

    @@all = []
    @@name = []
    @@city = []
    @@conference = []
    @@division = []

    def initialize(attributes)
        attributes.each do |key, value| 
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
        end
        @@all << self
        @@name << self.name
        @@city << self.city
        @@conference << self.conference
        @@division << self.division
    end

    def self.all
        @@all
    end

    def self.name
        @@name
    end

    def self.city
        @@city
    end

    def self.conference
        @@conference
    end

    def self.division
        @@division
    end
end