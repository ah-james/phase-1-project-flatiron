#Command Line Interface
# interacts with user and connects our files together
class CLI

    def self.begin
        puts "I hear you're looking for some NBA team information."
        API.start
        menu
    end

    def self.menu
        puts "How would you like to search?"
        puts "Please type 'city', 'conference', 'division', or 'team'."
        user_input = gets.strip.downcase
        if user_input == 'city'
            array_of_cities
        elsif user_input == 'conference'
            array_of_conferences
        elsif user_input == 'division'
            array_of_divisions
        elsif user_input == 'team'
            array_of_teams
        elsif user_input == 'exit'
            puts "Goodbye!"
        else
            #restarting the program
            menu
        end
    end

    def array_of_cities
        puts "Here's a list of NBA cities:"
    end

    def array_of_conferences
        puts "Which Conference would you like to search in?"
    end

    def array_of_divisions
        puts "Which Division would you like to search in?"
    end

    def array_of_teams
        puts "Which team do you want to know more about?"
    end

    def final_message 
        "The #{team} play in #{city}. They are a part of the #{division} in the #{conference} conference."
    end
end