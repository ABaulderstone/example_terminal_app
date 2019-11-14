class User
  attr_accessor :sign, :history
  attr_reader :name

  def initialize(name, birthday)
    @name = name
    @birthday = birthday
    @sign = ""
    @history = {}
  end

  def save
    user = {
      "name" => @name,
      "birthday" => @birthday,
      "sign" => @sign,
      "history" => @history,
    }

    $users << user

    File.open("./users.json", "w") do |f|
      f.write($users.to_json)
    end
  end

  def initalize_sign
    birthday_arr = @birthday.split("/")
    birthday_arr.map!(&:to_i)
    @sign = Date.new(birthday_arr[-1], birthday_arr[-2], birthday_arr[-3]).zodiac_sign
  end

  def get_horoscope
    response = HTTParty.get "http://horoscope-api.herokuapp.com/horoscope/today/#{@sign}"
    reading = response.body
    hash = JSON.parse reading
    puts hash["horoscope"]
  end
end
