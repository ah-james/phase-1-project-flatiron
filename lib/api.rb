# set up like a class
# responsible for talking to our API

class API
    def self.start
        url = "https://www.balldontlie.io/api/v1/teams"
        uri = URI(url) #prepares URL to work with gems
        response = Net::HTTP.get(uri) # allows ruby to get information from a website (specifically basketball API rn)
        formatted_response = JSON.parse(response) #takes API string, parses it, turns it into hash 
        teams_array = formatted_response["teams"]
        teams_array.each do |team| 
            #id, city, conference, division, team
            Model.new(team["id"], team["city"], team["conference"], team["division"], team["team"])
        end
    end
end