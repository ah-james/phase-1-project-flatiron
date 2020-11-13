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
            menu
        end
    end

    def self.user_response
        index = gets.strip.to_i - 1
        max_limit = Teams.all.length - 1
        unless index.between?(0, max_limit)
            puts "There isn't a team that corresponds with that number!"
            user_response
            index = gets.strip.to_i - 1
        end
        team_instance = Teams.all[index]
    end

    def self.city_array
        puts "Please select one of the following cities:"
        Teams.city.each_with_index { |key, value| puts "#{value + 1}. #{key}" }
        user_response
    end

    def self.conference_array
        puts "Which conference would you like to search in?"
        Teams.conference.uniq.each_with_index { |key, value| puts "#{value + 1}. #{key}" }
        user_response
    end

    def self.division_array
        puts "Which division would you like to search in?"
        Teams.division.uniq.each_with_index { |key, value| puts "#{value + 1}. #{key}" }
        user_response
    end

    def self.team_array
        puts "Which team do you want to know more about?"
        Teams.name.each_with_index { |key, value| puts "#{value + 1}. #{key}" }
        user_response
    end

    def self.final_message
        puts "The #{Teams.name.to_s} play in #{Teams.city.to_s}. They are a part of the #{Teams.division.to_s} in the #{Teams.conference.to_s} conference."
    end
end