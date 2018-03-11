Rails.application.routes.draw do
  namespace :v1 do 

    get "/contacts" => "contacts#index"
    post "/contacts" => "contacts#create" 
   

  end 

end
