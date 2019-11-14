require "json"
require "zodiac"
require "httparty"
require "artii"
require_relative "./database_setup.rb"
require_relative "./methods.rb"
Art = Artii::Base.new
Art.asciify("Daily Horoscope")
puts "Enter Your name"
name = gets.chomp.downcase
find_or_create(name)
