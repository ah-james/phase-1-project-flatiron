#Command Line Interface
# interacts with user and connects our files together
class CLI

    def self.begin
        puts "We'll take it from here."
        API.start
        menu
    end

    def self.menu
        puts "Do you want to search by city, conference, division, or team name?"
        puts "Please type 'city', 'conference', 'division', or 'team'."
        user_input = gets.strip.downcase
        if user_input == 'city'
            puts "Here's a list of NBA cities:"
        elsif user_input == 'conference'
            puts "Which Conference would you like to search in?"
        elsif user_input == 'division'
            "Which Division would you like to search in?"
        elsif user_input == 'team'
            "Which team do you want to know more about?"
        else
            #ending the program
            puts "Thank you for your service."
        end
    end
end

    def final_message 
        "The #{team} play in #{city}. They are a part of the #{division} in the #{conference} conference."
    end