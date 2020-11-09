# set up like a class
# responsible for talking to our API

class API
    def self.start
        url = "https://www.balldontlie.io/api/v1/teams"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        formatted_response = JSON.parse(response)
        teams_array = hash("teams")
    end
end