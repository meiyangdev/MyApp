Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'invoices#index'
  resources :invoices do
    post 'send_invoice_mail', to: 'send_invoice_mail', as: :send_invoice_mail
  end
  resources :clients
  get 'view_invoice/:uuid' => 'invoices#view_invoice', as: :view_invoice
end
