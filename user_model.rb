require_relative "./methods.rb"

class User
  attr_accessor :sign, :history
  attr_reader :name

  @@signs_array = ["Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo", "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"]

  def initialize(name, birthday, history)
    @name = name
    @birthday = birthday
    @sign = ""
    @history = history
  end

  def add_to_users
    user = {
      "name" => @name,
      "birthday" => @birthday,
      "sign" => @sign,
      "history" => @history,
    }

    $users << user
  end

  def update_history
    index = $users.index { |user| user["name"] == @name }
    $users[index]["history"] == @history
  end

  def save
    File.open("./users.json", "w") do |f|
      f.write($users.to_json)
    end
  end

  def initalize_sign
    birthday_arr = @birthday.split("/")
    birthday_arr.map!(&:to_i)
    @sign = Date.new(birthday_arr[-1], birthday_arr[-2], birthday_arr[-3]).zodiac_sign
  end

  def get_todays_horoscope
    response = HTTParty.get "http://horoscope-api.herokuapp.com/horoscope/today/#{@sign}"
    reading = response.body
    hash = JSON.parse reading
    data = hash["horoscope"]
    display_horoscope(@sign, Today.to_s, data)
    @history[Today.to_s] = data
  end

  def check_other_sign
    choice = Prompt.select("Which sign do you want to check?", @@signs_array)
    response = HTTParty.get "http://horoscope-api.herokuapp.com/horoscope/today/#{choice}"
    reading = response.body
    hash = JSON.parse reading
    wait_clear
    data = hash["horoscope"]
    display_horoscope(choice, Today.to_s, data)
  end

  def view_history
    if @history.keys.length > 0
      choice = Prompt.select("Select a date", @history.keys)
      display_horoscope(@sign, choice, @history[choice])
    else
      puts "Ooops, looks like there's no history to display"
    end
  end

  def main_menu
    choices = { "Get Today's Horoscope" => 1, "View History" => 2, "Check Another Sign" => 3, "Exit" => 4 }
    Prompt.select("What would you like to do today?", choices)
  end

  def quit
    system "clear"
    sleep(1)
    puts "Goodbye"
    exit(0)
  end
end
