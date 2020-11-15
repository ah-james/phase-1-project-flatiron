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

    def conferences
        Teams.conference.uniq.each_with_index { |key, value| puts "#{value + 1}. #{key}" }
    end

    def division
        Teams.division.uniq.each_with_index { |key, value| puts "#{value + 1}. #{key}" }
    end

    def city_array
        puts "Please select one of the following cities with the corresponding number or type 0 to exit:"
        Teams.city.each_with_index { |key, value| puts "#{value + 1}. #{key}" }
        team_and_city_response
    end

    def conference_array
        puts "Which conference would you like to search in? Please enter a number:"
        conferences
        conference_response
    end

    def conference_response
        response = gets.strip.to_i - 1
        max_limit = Teams.conference.length - 1
        unless response.between?(0, max_limit)
            puts "That number isn't an option, try again!"
            user_response
        end
        team_instance = Teams.conference[response]
        teams_in_conference
    end

    def teams_in_conference
        binding.pry
        conferences = Teams.select {|team| team["conference"] == "East" }
        
    end

    def division_array
        puts "Which division would you like to search in? Please enter a number:"
        divisions
        division_response
    end

    def division_response
        response = gets.strip.to_i - 1
        max_limit = Teams.division.length - 1
        unless response.between?(0, max_limit)
            puts "That number isn't an option, try again!"
            user_response
        end
        team_instance = Teams.division[response]
        teams_in_division
    end

    def teams_in_division
        puts "conference name"
    end

    def team_array
        puts "Which team do you want to know more about? Please enter a number or type 0 to exit:"
        Teams.name.each_with_index { |key, value| puts "#{value + 1}. #{key}" }
        team_and_city_response
    end

    def team_and_city_response
        response = gets.strip.to_i - 1
        max_limit = Teams.all.length - 1
        unless response.between?(0, max_limit)
            puts "That number isn't an option, try again!"
            team_and_city_response
        end
        team_instance = Teams.all[response]
        final_message(team_instance)
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