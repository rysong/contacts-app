class V1::ContactsController < ApplicationController
  
  def index 
    contacts = Contact.all 
    render json: contacts.as_json
  end 

  def create 
    contact = Contact.new(
      first_name: params["first_name"],
      last_name: params["last_name"],
      email: params["email"],
      phone_number: params["phone_number"]
      )
    contact.save
    render json: contact.as_json
  end 

  def show 
    contact_id = params["id"]
    contact = Contact.find_by(id: contact_id)
    render json: contact.as_json 
  end 

end
