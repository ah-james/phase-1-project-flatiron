# set up like a class
# responsible for talking to API

class API
    def self.start
        uri = URI("https://www.balldontlie.io/api/v1/teams") #prepares URL to work with gems 
        formatted_response = JSON.parse(Net::HTTP.get(uri)) #Net::HTTP allows ruby to get information from a website (specifically basketball API rn), then takes API string, parses it, turns it into hash 
        teams_array = formatted_response["data"]
        teams_array.each do |team|
            Teams.new(team)
        end
    end
end