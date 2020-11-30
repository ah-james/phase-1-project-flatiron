class Teams

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

    def self.rivals(team_instance)
        counter = 0
        print "\nYour team's rivals are the "
        self.all.select do |team|
            if team.name != team_instance.name && team.division == team_instance.division
                print team.name
                counter += 1
                if counter == 4
                    print ".\n"
                elsif counter == 3
                    print ", and "
                else print ", "
                end
            end
        end
    end
end