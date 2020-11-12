# set up like a class
# responsible for talking to our API

class API
    def self.start
        uri = URI("https://www.balldontlie.io/api/v1/teams") #prepares URL to work with gems
        response = Net::HTTP.get(uri) # allows ruby to get information from a website (specifically basketball API rn)
        formatted_response = JSON.parse(response) #takes API string, parses it, turns it into hash 
        teams_array = formatted_response["data"]
        teams_array.each do |team|
            Teams.new(team)
        end
    end
end