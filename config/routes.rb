Rails.application.routes.draw do
  namespace :ifttt do
    namespace :locations do
      post 'kitaku/create'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
