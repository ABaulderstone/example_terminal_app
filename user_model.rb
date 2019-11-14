class User
  attr_accessor :sign, :history

  def initialize(name, birthday, sign = "", history = {})
    @name = name
    @birthday = birthday
    @sign = sign
    @history = history
  end

  def save
    user = {
      "name" => name,
      "birthday" => birthday,
      "sign" => sign,
      "history" => {},
    }

    $users << user

    File.open("./users.json", "w") do |f|
      f.write($users.to_json)
    end
  end

  def initalize_sign
    @birthday = birthday.split("/")
    @birthday.map!(&:to_i)
    sign = Date.new(birthday[-1], birthday[-2], birthday[-3]).zodiac_sign
  end
end
