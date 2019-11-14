require "json"
require "zodiac"
require "httparty"
require "artii"
require_relative "./database_setup.rb"
require_relative "./methods.rb"
Art = Artii::Base.new
puts Art.asciify("Daily Horoscope")
puts "Enter Your name"
name = gets.chomp.downcase
session_user = find_or_create(name)
session_user.initalize_sign
session_user.save
session_user.get_horoscope
