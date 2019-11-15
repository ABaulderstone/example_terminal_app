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

while true
  # system "clear"
  menu_choice = session_user.main_menu
  case menu_choice
  when 1
    session_user.get_todays_horoscope
  when 2
    session_user.view_history
  when 3
    session_user.check_other_sign
  when 4
    session_user.quit
  end
end
