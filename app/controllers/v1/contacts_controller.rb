class V1::ContactsController < ApplicationController
  
  def index 
    contacts = Contact.all 

    search = params["input_search"]
    if search 
      contacts = contacts.where(
        "first_name ILIKE ? 
        OR last_name ILIKE ?
        OR email ILIKE ?
        OR phone_number ILIKE ?", 
        "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"
        )
    end 
    render json: contacts.as_json
  end 

  def create 
    contact = Contact.new(
      first_name: params["first_name"],
      middle_name: params["middle_name"], 
      last_name: params["last_name"],
      email: params["email"],
      phone_number: params["phone_number"]
      )
    
    if contact.save
      render json: contact.as_json
    else 
      render json: {errors: contact.errors.full_messages}, status: :unprocessable_entity 
    end 

  end 

  def show 
    contact_id = params["id"]
    contact = Contact.find_by(id: contact_id)
    render json: contact.as_json 
  end 

  def update 
    contact_id = params["id"]
    contact = Contact.find_by(id: contact_id)

    contact.first_name = params["first_name"] || contact.first_name
    contact.middle_name = params["middle_name"] || contact.middle_name
    contact.last_name = params["last_name"] || contact.last_name 
    contact.email = params["email"] || contact.email 
    contact.phone_number = params["phone_number"] || contact.phone_number  

    if contact.save
      render json: contact.as_json
    else 
      render json: {errors: contact.errors.full_messages}, status: :unprocessable_entity 
    end 

  end 

  def destroy 
    contact_id = params["id"]
    contact = Contact.find_by(id: contact_id)
    contact.destroy 
    render json: {message: "contact #{contact_id} successfully destroyed"} 
  end 

end
