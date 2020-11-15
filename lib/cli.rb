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
        puts "Please type 'team' or 'hometown'."
        user_input = gets.strip.downcase
        if user_input == 'hometown'
            hometowns_array
        elsif user_input == 'team'
            team_array
        elsif user_input == 'exit'
            puts "Goodbye!"
        else
            #restarting the program
            puts "Please try again."
            puts ''
            menu
        end
    end

    def hometowns_array
        puts "Please select one of the following cities with the corresponding number:"
        hometowns
    end

    def hometowns
        Teams.hometown.each_with_index { |key, value| puts "#{value + 1}. #{key}" }
        user_response
    end

    def user_response
        response = gets.strip.to_i - 1
        max_limit = Teams.all.length - 1
        unless response.between?(0, max_limit)
            puts "That isn't an option, try again!"
            user_response
        else
            team_instance = Teams.all[response]
            final_message(team_instance)
        end  
    end

    def team_array
        puts "Which team do you want to know more about? Please enter a number or type 0 to exit:"
        Teams.name.each_with_index { |key, value| puts "#{value + 1}. #{key}" }
        user_response
    end

    def final_message(team_instance)
        puts ''
        puts "The #{team_instance.name.to_s} play in #{team_instance.city.to_s}. They are a part of the #{team_instance.division.to_s} division in the #{team_instance.conference.to_s} conference."
        puts ''
        rivals_question(team_instance)
    end

    def rivals_question(team_instance)
        puts "Would you like to see your team's rivals? Yes or No:"
        user_input = gets.strip.downcase
        if user_input == 'yes'
            final_teams_rivals(team_instance)
        elsif user_input == 'no'
            final_question
        else
            puts "That wasn't an option. Please put yes or no:"
            puts ''
            rivals_question
        end
    end

    def final_teams_rivals(team_instance)
        binding.pry
    end

    def final_question
        puts "Would you like to go again? Yes or No:"
        user_input = gets.strip.downcase
        if user_input == 'yes'
            menu
        elsif user_input == 'no'
            puts "Goodbye!"
            exit
        else
            puts "That wasn't an option. Please put yes or no:"
            puts ''
            final_question
        end
    end
end

