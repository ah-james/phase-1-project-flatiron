#require all files so they can talk to each other

require 'bundler'
Bundler.require # requires all gems listed in the Gemfile

#makes the environment file interact with other files in the main folder (API)
require_relative "./lib/api" 
require_relative "./lib/cli"
require_relative "./lib/teams"