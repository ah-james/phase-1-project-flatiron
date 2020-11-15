# your stand OO ruby class

class Teams
#    attributes city, conference, division, name

    @@all = []
    @@name = []
    @@hometown = []
    @@division = []

    def initialize(attributes)
        attributes.each do |key, value| 
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
        end
        @@all << self
        @@name << self.name
        @@hometown << self.city
        @@division << self.division
    end

    def self.all
        @@all
    end

    def self.name
        @@name
    end

    def self.hometown
        @@hometown
    end

    def self.division
        @@division
    end

    def self.in_division

    end
end