Rails.application.routes.draw do
  namespace :v1 do 

    get "/contacts" => "contacts#index"
    
  end 

end
