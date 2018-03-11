class V1::ContactsController < ApplicationController
  
  def index 
    contacts = Contact.all 
    render json: contacts.as_json

  end 

end
