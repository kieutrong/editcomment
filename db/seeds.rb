User.create! name: "Admin", email: "admin@gmail.com",
  password: "123456", password_confirmation: "123456", is_admin: true

20.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "123456"
  User.create! name: name,
    email: email, password: password, password_confirmation: password
end
