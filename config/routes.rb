Rails.application.routes.draw do
  namespace :v1 do 
    get "/contacts_site" => "contacts#contact_info"
  end 
end
