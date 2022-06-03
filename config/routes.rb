Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'invoices#index'
  resources :invoices
  resources :clients
  get 'view_invoice/:uuid' => 'invoices#view_invoice', as: :view_invoice
end
