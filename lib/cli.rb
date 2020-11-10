#Command Line Interface
# interacts with user and connects our files together
class CLI

    def start
        puts "Greetings, user."
        API.start
        self.menu
    end

    def menu
        puts "Do you want to search by city, conference, division, or team name?"
        puts "Please type 'city', 'conference', 'division', or 'team'."
        user_input = gets.strip.downcase
        if user_input == 'city'
            puts "Here's a list of NBA cities:"
        end
    end
end