Colegiobq::Application.routes.draw do
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up"
  get "adm_board" => "sessions#show", :as => "adm_board"
  resources :administradores, :users, :sessions
  resources :colegios do
    collection do
      get 'result' 
    end
  end
  root 'colegios#index'
end
