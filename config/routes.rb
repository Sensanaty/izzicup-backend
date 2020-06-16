Rails.application.routes.draw do
  scope :v1, defaults: { format: :json } do
    resources :parts
    resources :users
    post 'authenticate', to: 'authentication#authenticate'
  end

end
