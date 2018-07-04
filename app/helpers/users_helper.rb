module UsersHelper
  def age(birthday)
    today = Date.today
    age = today.year - birthday.year
    age -= 1 if birthday.strftime("%M%d").to_i > today.strftime("%m%d").to_i
    age
  end
end
