# your stand OO ruby class

class Teams
#    attr_accessor :id, :city, :conference, :division, :name

    @@all = []

    def initialize(attributes)
        attributes.each do |key, value| 
            self.class.attr_accessor(key)
            self.send(("#{key}="), value)
        end
        @@all << self
    end

    def self.all
        @@all
    end
end