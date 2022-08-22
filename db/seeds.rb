require 'faker'

puts "> Cleaning the redore database, please wait..."
User.destroy_all

puts "> Creating eco-conscious users"

# add realistic UK LON addresses below later which will be sampled
# address = [""]

10.times do
  user = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    is_owner: true,
    email: Faker::Internet.email,
    password: "123456"
  )
  puts "> User with id #{user.id} has been created"

  puts ">> Creating listing for user with id #{user.id}"

  listing = Listing.create(
    title: Faker::Company.name,
    address: aker::Address.full_address
    # address: address.sample, -> only uncomment after setting real UK address above
    details: Faker::Lorem.paragraph(sentence_count: 10),
    price: Faker::Commerce.price,
    user_id: user.id
  )
  puts ">>> Recycle collections now offered by #{listing.title}"
end
puts "--- Job done!---"
