# your stand OO ruby class

class Teams
#    attributes city, conference, division, name

    @@all = []
    @@name = []
    @@hometown = []

    def initialize(attributes)
        attributes.each do |key, value| 
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
        end
        @@all << self
        @@name << self.name
        @@hometown << self.city
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
end