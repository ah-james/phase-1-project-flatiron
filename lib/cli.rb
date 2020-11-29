class CLI

    def initialize
        puts "I hear you're looking for some NBA team information."
        API.new
        menu
    end

    def menu
        puts "\nHow would you like to search?"
        puts "\nPlease type 'team' or 'hometown'."
        user_input = gets.strip.downcase
        if user_input == 'hometown'
            hometowns_array
        elsif user_input == 'team'
            team_array
        elsif user_input == 'exit'
            goodbye
        else
            puts "\nPlease try again."
            menu
        end
    end

    def goodbye
        puts "Goodbye!"
        exit
    end

    def hometowns_array
        puts "\nHere are the cities that NBA teams play in:"
        hometowns
    end

    def hometowns
        Teams.hometown.each_with_index { |key, value| puts "#{value + 1}. #{key}" }
        user_response
    end

    def exit_or_menu
        user_input = gets.strip.downcase
        if user_input == 'exit'
            goodbye
        elsif user_input == 'menu'
            menu
        end
    end

    def user_response
        puts "\nPlease input a number!"
        response = gets.strip.to_i - 1               
        max_limit = Teams.all.length - 1
        until response.between?(0, max_limit)
            puts "\nThat isn't an option, try again!"
            user_response
        end
        team_instance = Teams.all[response]
        final_message(team_instance)
    end

    def team_array
        puts "\nHere are the teams that play in the NBA:"
        teams
    end

    def teams
        Teams.name.each_with_index { |key, value| puts "#{value + 1}. #{key}" }
        user_response
    end

    def final_message(team_instance)
        puts "\nThe #{team_instance.name.to_s} play in #{team_instance.city.to_s}. They are a part of the #{team_instance.division.to_s} division in the #{team_instance.conference.to_s}ern conference.\n"
        rivals_question(team_instance)
    end

    def rivals_question(team_instance)
        puts "\nWould you like to see your team's rivals? Yes or No:"
        user_input = gets.strip.downcase
        if user_input == 'yes'
            final_team_rivals(team_instance)
        elsif user_input == 'no'
            final_question
        elsif user_input == 'exit'
            goodbye
        else
            puts "\nThat wasn't an option. Please put yes or no:\n"
            rivals_question
        end
    end

    def final_team_rivals(team_instance)
        puts "\nYour team's rivals are the:"
        Teams.rivals(team_instance)
        final_question
    end

    def final_question
        puts "\nWould you like to go again? Yes or No:"
        user_input = gets.strip.downcase
        if user_input == 'yes'
            menu
        elsif user_input == 'no' || user_input == 'exit'
            goodbye
        else
            puts "\nThat wasn't an option. Please put yes or no:"
            final_question
        end
    end
end

