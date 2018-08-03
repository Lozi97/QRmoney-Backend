
Rails.application.routes.draw do
  

  namespace :api , defaults: {format: :json} do
    namespace :v1 do
      resources :deposits
      resources :withdraws
      post '/login', to: 'authentication#authenticate'
  
      namespace :user do
        resources :users 
      end

      namespace :hajji do
        get '/HajjiByQR/:qr', to: 'hajjis#getHajjiByQR'
        resources :hajjis

      end

      namespace :admin do
          resources :deposits
          resources :withdraws
          resources :hajjis
          resources :users
      end
    end
  end

end


