User.create!(email: "test@email.com", password: "password", password_confirmation: 'password')
puts "Email: test@email.com\nPassword: password"

puts "Generating 50 parts"
50.times do
  Part.create(part_number: Faker::Alphanumeric.alphanumeric(number: rand(9..16)).upcase,
              owner: Faker::Company.name,
              date_added: DateTime.now,
              description: Faker::ElectricalComponents.passive + " " + Faker::Appliance.equipment,
              available: rand(11..1500),
              reserved: rand(1..10),
              sold: rand(0..50),
              condition: "NE",
              cost_min: rand(200..3000).floor(-3),
              price_min: 3500,
              order_min: 10,
              lead_time: "3 DAYS",
              quote_type: "OUTRIGHT SALE",
              tag: "MOQ 1123123 JABALABADADAD"
              )
end