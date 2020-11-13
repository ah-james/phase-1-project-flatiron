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
            user_response
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
        puts final_message
    end

    def self.array_of_cities
        puts "Please select one of the following cities:"
        Teams.cities.each_with_index { |key, value| puts "#{value + 1}. #{key}" }
    end

    def self.array_of_conferences
        puts "Which conference would you like to search in?"
        Teams.conferences.each_with_index { |key, value| puts "#{value + 1}. #{key.name}" }
    end

    def self.array_of_divisions
        puts "Which division would you like to search in?"
        Teams.divisions.each_with_index { |key, value| puts "#{value + 1}. #{key.name}" }
    end

    def self.array_of_teams
        puts "Which team do you want to know more about?"
        Teams.all.each_with_index { |key, value| puts "#{value + 1}. #{key.name}" }
    end

    def self.final_message
        puts "The #{self.team} play in #{self.city}. They are a part of the #{self.divison} in the #{self.conference} conference."
    end
end