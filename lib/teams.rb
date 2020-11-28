class Teams
#    attributes city, division, name

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

    def self.name
        self.all.map { |team| team.name}
    end

    def self.hometown
        self.all.map { |team| team.city }
    end

    def self.division
        self.all.map { |team| team.division }
    end

    def self.rivals
        self.all.select do |variable|
        end
    end

    def rivals
        Teams.division.select do |team|
            if team.name == team.name
                next
            end
            if team.division == team.division
                puts team.name
            end
        end
    end
end