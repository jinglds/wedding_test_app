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
    users = User.all
    2.times do
      name = Faker::Company.name
      phone =  Faker::PhoneNumber.cell_phone
      address = Faker::Address.city
      primary_contact = Faker::PhoneNumber.cell_phone
      details = ["auto", "non-auto"]
      email = "shop@abc.com"
      shop_type = ["Attire", "Photography", "Music", "Invitation Card", "Decoration"]
      description = Faker::Lorem.sentence(3)
      website = Faker::Internet.domain_name
      users.each { |user| user.shops.create!(
                                              name: name,
                                              shop_type: shop_type.sample,
                                              email: email,
                                              phone: phone,
                                              address: address,
                                              primary_contact: primary_contact,
                                              details: details.sample,
                                              website: website,
                                              description: description
                                              ) }



    end
    2.times do
      name = Faker::Name.name
      date =  Date.new(2015,4,20)
      time = Time.new(2.15,4,20,20,00,00, "+07:00")
      budget = 500000
      bride_name = Faker::Name.name
      groom_name = Faker::Name.name
      event_type = ["Evening Party", "Budhist Ceremory","Christian Ceremony", "Chinese Ceremony"]
      users.each { |user| user.events.create!(
                                              name: name,
                                              date: date,
                                              time: time,
                                              budget: budget,
                                              bride_name: bride_name,
                                              groom_name: groom_name,
                                              event_type: event_type.sample
                                              ) }
    end
  end
end
