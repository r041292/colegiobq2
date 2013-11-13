Colegiobq::Application.routes.draw do
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "sign_up" => "users#new", :as => "sign_up"
  get "adm_board" => "sessions#show", :as => "adm_board"
  get "creditos" => "creditos#index", :as => "creditos"
get "manual" => "manual#index", :as =>"manual"


  resources  :users, :sessions, :estrella


  resources :colegios do
    collection do
      get 'result' 
      get 'avanzada'
      get 'ravanzada'
    end
  end
  root 'colegios#index'
end
