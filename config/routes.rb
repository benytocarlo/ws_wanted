WsMmWanted::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resources :prizes
  resources :codes
  resources :sonies

  get "/facebook_id/:facebook_id/code/:code" => "codes#is_winner?" 
  get "sony/crear_participante/facebook_id/:facebook_id/" => "sonies#create_participation" 
  get "sony/actualizar_participante/facebook_id/:facebook_id/amigos_share/:amigos_share/" => "sonies#update_participation" 
  get "sony/intento/facebook_id/:facebook_id/" => "sonies#user_tries?" 

  get "/sony/create_winner/facebook_id/:facebook_id/code/:code" => "sonies#create_winner"
  get "/sony/intentos/:facebook_id" => "sonies#intentos"
  get "/sony/premios" => "sonies#devuelve_premios"
end
