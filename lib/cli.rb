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
            city_array
        elsif user_input == 'conference'
            conference_array
        elsif user_input == 'division'
            division_array
        elsif user_input == 'team'
            team_array
        elsif user_input == 'exit'
            puts "Goodbye!"
        else
            #restarting the program
            puts "Please try again."
            menu
        end
    end

    def self.user_response
        response = gets.strip.to_i - 1
        max_limit = Teams.all.length - 1
        unless response.between?(0, max_limit)
            puts "That number isn't an option, try again!"
            user_response
        end
        team_instance = Teams.all[response]
        final_message(team_instance)
    end

    def self.city_array
        puts "Please select one of the following cities with the corresponding number:"
        Teams.city.each_with_index { |key, value| puts "#{value + 1}. #{key}" }
        user_response
    end

    def self.conference_array
        puts "Which conference would you like to search in? Please enter a number:"
        Teams.conference.uniq.each_with_index { |key, value| puts "#{value + 1}. #{key}" }
        user_response
    end

    def self.division_array
        puts "Which division would you like to search in? Please enter a number:"
        Teams.division.uniq.each_with_index { |key, value| puts "#{value + 1}. #{key}" }
        user_response
    end

    def self.team_array
        puts "Which team do you want to know more about? Please enter a number:"
        Teams.name.each_with_index { |key, value| puts "#{value + 1}. #{key}" }
        user_response
    end

    def self.final_message(team_instance)
        puts "The #{team_instance.name.to_s} play in #{team_instance.city.to_s}. They are a part of the #{team_instance.division.to_s} division in the #{team_instance.conference.to_s} conference."
        puts "Would you like to go again? Yes or No:"
        user_input = gets.strip.downcase
            if user_input == 'yes'
                menu
            elsif user_input == 'no'
                puts "Goodbye!"
                exit
            else
                puts "That wasn't an option. Please put yes or no:"
        end
    end
end