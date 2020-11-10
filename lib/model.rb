# your stand OO ruby class

class Model
    attr_accessor :id, :city, :conference, :division, :team

    @@all = []

    def initialize(id, city, conference, division, team)
        @id = id
        @city = city
        @conference = conference
        @division = division
        @team = team 

        @@all << self
    end

    def self.all
        @@all
    end

end