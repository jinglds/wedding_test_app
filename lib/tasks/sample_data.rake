namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(firstname: "Ladasa",
                lastname: "Tiraviryapol",
                address: "Bangkok",
                primary_contact: "0855081078",
                 email: "jinpeko@gmail.com",
                 password: "1234567",
                 password_confirmation: "1234567",
                 role: "admin")
    99.times do |n|
      firstname  = Faker::Name.first_name
      lastname  = Faker::Name.last_name
      address = Faker::Address.city
      primary_contact = Faker::PhoneNumber.cell_phone
      email = "example-#{n+1}@abc.com"
      password  = "password"
      role ="client"
      User.create!(firstname: firstname,
                   lastname: lastname,
                   address: address,
                   primary_contact: primary_contact,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   role: role)
    end
  end
end