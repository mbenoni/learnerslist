# User.create!(email: "example@example.com",
#              password: "foobar",
#              password_confirmation: "foobar")

25.times do |n|
  Resource.create!(url: "http://www.example.com",
                   description: "This is a description for the example url.",
                   user_id: 1)
end