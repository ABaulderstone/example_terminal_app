require "json"
require "zodiac"
require "httparty"
require "artii"
require "tty-prompt"
require "colorize"
require "date"

require_relative "./database_setup.rb"
require_relative "./methods.rb"

Today = Date.today
Art = Artii::Base.new
Prompt = TTY::Prompt.new

puts Art.asciify("Daily Horoscope")

puts "Enter Your name"
name = gets.chomp.downcase
session_user = find_or_create(name)
session_user.initalize_sign
session_user.save
welcome_message(session_user)

while true
  menu_choice = session_user.main_menu
  welcome_message(session_user)
  case menu_choice
  when 1
    session_user.get_todays_horoscope
    session_user.update_history
    session_user.save
  when 2
    session_user.view_history
  when 3
    session_user.check_other_sign
  when 4
    session_user.quit
  end
end
