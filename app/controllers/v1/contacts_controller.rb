class V1::ContactsController < ApplicationController
  
  def contact_info 
    contacts = Contact.all 

    contacts_array = []
    index = 0 

    contacts.length.times do 
      contact_hash = {}
      contact_hash[:first_name] = contacts[index]["first_name"]
      contact_hash[:last_name] = contacts[index]["last_name"]
      contact_hash[:email] = contacts[index]["email"]
      contact_hash[:phone_number] = contacts[index]["phone_number"]
      contacts_array << contact_hash 
      index += 1
    end 

    render json: {contacts: contacts_array} 

  end 

end
