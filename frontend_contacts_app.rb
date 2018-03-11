require "Unirest"
system "clear"

puts "This is the Contact List App"
puts ""
response = Unirest.get("http://localhost:3000/v1/contacts_site")
contacts = response.body["contacts"]

#puts JSON.pretty_generate(contacts) JSON gem came with Unirest 

index = 0
contacts.length.times do 
  puts "#{index + 1}."
  puts "First Name: #{contacts[index]["first_name"]}"
  puts "Last Name: #{contacts[index]["last_name"]}"
  puts "Email: #{contacts[index]["email"]}"
  puts "Phone Number: #{contacts[index]["phone_number"]}"
  index = index + 1 
  puts ""
end 






