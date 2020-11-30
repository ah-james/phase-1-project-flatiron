class CLI

    def initialize
        puts "I hear you're looking for some NBA team information."
        API.new
        menu
    end

    def menu
        sleep 0.5
        puts "How would you like to search?"
        puts "\nPlease type 'team' or 'hometown'".light_blue
        user_input = gets.strip.downcase
        if user_input == 'hometown'
            hometowns_array
        elsif user_input == 'team'
            team_array
        elsif user_input == 'exit'
            goodbye
        else
            error
            menu
        end
    end

    def error
        puts "\nThat isn't an option! Please try again?\n".light_blue
    end

    def goodbye
        puts "\nGoodbye!"
        exit
    end

    def slowing_down_program
        print "\nRetrieving".green
        sleep 0.4
        print ".".green
        sleep 0.4
        print ".".green
        sleep 0.4
        print ".\n".green
        sleep 1
    end

    def hometowns_array
        slowing_down_program
        puts "\nHere are the cities that NBA teams play in:".light_blue
        hometowns
    end

    def hometowns
        Teams.hometown.each_with_index { |key, value| puts "#{value + 1}. #{key}" }
        response
    end

    def response
        sleep 0.5
        puts "\nPlease input a number!".light_blue
        user_input = gets.strip.to_i - 1           
        max_limit = Teams.all.length - 1
        if user_input.between?(0, max_limit)
            team_instance = Teams.all[user_input]
            final_message(team_instance)
        else
            error
            response
        end
    end

    def team_array
        slowing_down_program
        puts "\nHere are the teams that play in the NBA:".light_blue
        teams
    end

    def teams
        Teams.name.each_with_index { |key, value| puts "#{value + 1}. #{key}" }
        response
    end

    def final_message(team_instance)
        slowing_down_program
        puts "\nThe #{team_instance.name.to_s} play in #{team_instance.city.to_s}. They are a part of the #{team_instance.division.to_s} division in the #{team_instance.conference.to_s}ern conference.\n"
        rivals_question(team_instance)
    end

    def rivals_question(team_instance)
        sleep 3
        puts "\nWould you like to see your team's rivals? Yes or No:".light_blue
        user_input = gets.strip.downcase
        if user_input == 'yes'
            final_team_rivals(team_instance)
        elsif user_input == 'no'
            final_question
        elsif user_input == 'exit'
            goodbye
        else
            error
            rivals_question
        end
    end

    def final_team_rivals(team_instance)
        slowing_down_program
        Teams.rivals(team_instance)
        final_question
    end

    def final_question
        puts "\nWould you like to go again? Yes or No:".light_blue
        user_input = gets.strip.downcase
        if user_input == 'yes'
            menu
        elsif user_input == 'no' || user_input == 'exit'
            goodbye
        else
            error
            final_question
        end
    end
end