require "Unirest"
system "clear"

puts "This is the Contact List App. Select an option: "
puts "[1] Show all contacts"
puts "[2] Create a contact" 
puts "[3] Show a contact"

input = gets.chomp 

if input == "1" 
  response = Unirest.get("http://localhost:3000/v1/contacts")
  contacts = response.body
  puts JSON.pretty_generate(contacts) #JSON gem came with Unirest 

elsif input == "2"
  params = {}
  print "Enter a first name: "
  params["first_name"] = gets.chomp 
  print "Enter a last name: "
  params["last_name"] = gets.chomp
  print "Enter an email: "
  params["email"] = gets.chomp
  print "Enter a phone number: "
  params["phone_number"] = gets.chomp

  response = Unirest.post("http://localhost:3000/v1/contacts", parameters: params)
  contact = response.body 
  puts JSON.pretty_generate(contact)

elsif input == "3"
  print "Enter a contact id: "
  input_id = gets.chomp 

  response = Unirest.get("http://localhost:3000/v1/contacts/#{input_id}") 
  contact = response.body 
  puts JSON.pretty_generate(contact)

end 





