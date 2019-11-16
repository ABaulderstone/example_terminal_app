require "json"
require "zodiac"
require "httparty"
require "artii"
require "tty-prompt"
require "colorize"
require "date"

require_relative "./db/database_setup.rb"
require_relative "./methods.rb"
require_relative "./user_model.rb"

Today = Date.today
Art = Artii::Base.new
Prompt = TTY::Prompt.new
name = nil

if ARGV.length > 0
  flag, *args = ARGV
  ARGV.clear

  case flag

  when "-help"
    require_relative "./help.rb"
  when "-name"
    name = args[0].downcase
  when "-sign"
    if User.signs_array.include?(args[0].capitalize)
      data = fetch_horoscope(args[0])
      display_horoscope(args[0].capitalize, Today.to_s, data)
    else
      puts "That's not a sign".colorize(:red)
    end
    exit(0)
  else
    puts "Invalid Argument"
    exit(0)
  end
end

puts Art.asciify("Daily Horoscope")

unless name
  puts "Enter Your name"
  name = gets.chomp.downcase
end

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
