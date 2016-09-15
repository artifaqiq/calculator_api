Rails.application.routes.draw do

  match '/calculate' => 'calculator#show', :via => [:get, :options]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
