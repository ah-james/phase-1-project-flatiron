# set up like a class
# responsible for talking to our API

class API
    def self.start
        url = "https://www.balldontlie.io/api/v1/teams"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        formatted_response = JSON.parse(response)
        teams_array = formatted_response["teams"]
        teams_array.each do |team| 
            #id, city, conference, division, team
            Model.new(team["id"], team["city"], team["conference"], team["division"], team["team"])
        end
    end
end