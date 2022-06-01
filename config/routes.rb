Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root 'invoices#index' 
  resources :invoices
  get 'view_invoice/:uuid' => 'invoices#view_invoice', as: :view_invoice
  #resources :invoices, only: [:index, :show]

 
  
   
end
