require "Unirest"

system "clear"
puts "This is the Contact List App. Select an option: "
puts "[signup] Signup (create a user)"
puts "[login] Login (create a JSON web token)"
puts "[logout] Logout (delete the JSON web token)"

input_option = gets.chomp 

if input_option == "signup"
  params = {
  name: "Richard",
  email: "richard@email.com",
  password: "password",
  password_confirmation: "password"
  } 
  response = Unirest.post("http://localhost:3000/v1/users", parameters: params)
  p response.body

elsif input_option == "login" 
  response = Unirest.post(
  "http://localhost:3000/user_token",
  parameters: {
    auth: {
      email: "richard@email.com",
      password: "password"
    }
  }
  )
  jwt = response.body["jwt"]
  Unirest.default_header("Authorization", "Bearer #{jwt}")

elsif input_option == "logout"
  jwt = ""
  Unirest.clear_default_headers()
end 
puts "Your jwt is #{jwt}"
puts ""
puts "Press enter to continue"
gets.chomp 

system "clear"
puts "[1] Show all contacts"
puts "  [1.1] Search for a contact" 
puts "[2] Create a contact" 
puts "[3] Show a contact"
puts "[4] Update a contact"
puts "[5] Destroy a contact" 

input = gets.chomp 

if input == "1" 
  response = Unirest.get("http://localhost:3000/v1/contacts")
  contacts = response.body
  puts JSON.pretty_generate(contacts) #JSON gem came with Unirest 

elsif input =="1.1"
  print "Enter a search: "
  input_search = gets.chomp 
  response = Unirest.get("http://localhost:3000/v1/contacts?input_search=#{input_search}")
  contact = response.body 
  puts JSON.pretty_generate(contact)

elsif input == "2"
  params = {}
  print "Enter a first name: "
  params["first_name"] = gets.chomp 
  print "Enter a middle name: "
  params["middle_name"] = gets.chomp
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
  print "Enter the id of the contact to show: "
  input_id = gets.chomp 

  response = Unirest.get("http://localhost:3000/v1/contacts/#{input_id}") 
  contact = response.body  

  if contact == "null" 
    puts "a contact with that id does not exist"
  else 
    puts JSON.pretty_generate(contact)
  end 

elsif input == "4"
  print "Enter the id of the contact to update: "
  input_id = gets.chomp 

  response = Unirest.get("http://localhost:3000/v1/contacts/#{input_id}") 
  contact = response.body

  params = {}
  print "Enter an updated first name (#{contact["first_name"]}): " 
  params["first_name"] = gets.chomp 
  print "Enter an updated middle name (#{contact["middle_name"]}): " 
  params["middle_name"] = gets.chomp 
  print "Enter an updated last name (#{contact["last_name"]}): " 
  params["last_name"] = gets.chomp 
  print "Enter an updated email (#{contact["email"]}): " 
  params["email"] = gets.chomp 
  print "Enter an updated phone number (#{contact["phone_number"]}): " 
  params["phone_number"] = gets.chomp

  params.delete_if { |_key, value| value.empty? }

  response = Unirest.patch("http://localhost:3000/v1/contacts/#{input_id}", parameters: params)
  updated_contact = response.body 
  puts JSON.pretty_generate(updated_contact) 

elsif input == "5"
  print "Enter the id of the contact to destroy: "
  input_id = gets.chomp 

  response = Unirest.delete("http://localhost:3000/v1/contacts/#{input_id}") 
  body = response.body

  puts JSON.pretty_generate(body)

end 





