#Command Line Interface
# interacts with user and connects our files together
class CLI

    def initialize
        puts "I hear you're looking for some NBA team information."
        API.new
        menu
    end

    def menu
        puts "How would you like to search?"
        puts "Please type 'city' or 'hometown'."
        user_input = gets.strip.downcase
        if user_input == 'city'
            city_array
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

    def city_array
        puts "Please select one of the following cities with the corresponding number or type 0 to exit:"
        cities
        response
    end

    def hometowns
        Teams.hometown.each_with_index { |key, value| puts "#{value + 1}. #{key}" }
    end

    def response
        response = gets.strip.to_i - 1
        max_limit = Teams.all.length - 1
        unless response.between?(0, max_limit)
            puts "That number isn't an option, try again!"
            response
        end
        team_instance = Teams.all[response]
        final_message(team_instance)
    end

    def team_array
        puts "Which team do you want to know more about? Please enter a number or type 0 to exit:"
        teams
        response
    end

    def teams
        Teams.name.each_with_index { |key, value| puts "#{value + 1}. #{key}" }
    end

    def final_message(team_instance)
        puts ''
        puts "The #{team_instance.name.to_s} play in #{team_instance.city.to_s}. They are a part of the #{team_instance.division.to_s} division in the #{team_instance.conference.to_s} conference."
        puts ''
        puts "Would you like to go again? Yes or No:"
        user_input = gets.strip.downcase
            if user_input == 'yes'
                menu
            elsif user_input == 'no'
                puts "Goodbye!"
                exit
            else
                puts "That wasn't an option. Please put yes or no:"
                final_message(team_instance)
        end
    end
end