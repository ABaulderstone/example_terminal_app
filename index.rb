require "json"
require "zodiac"
require "httparty"
require "artii"
require "tty-prompt"
require_relative "./database_setup.rb"
require_relative "./methods.rb"
Art = Artii::Base.new
Prompt = TTY::Prompt.new
puts Art.asciify("Daily Horoscope")
puts "Enter Your name"
name = gets.chomp.downcase
session_user = find_or_create(name)
session_user.initalize_sign
session_user.save
session_user.main_menu
