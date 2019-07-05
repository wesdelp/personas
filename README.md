# personas

## Setup

```bash
rails g personas:install
```

## Create a new persona

```bash
rails g personas:create Admin
```

# Route Helpers
Personas includes route helper methods to lock down your routes to authorized personas. When a persona that isn't the intended tries to access a route for another persona, they will receive a `404 Not Found` HTTP response. 

```ruby
# config/routes.rb

Rails.application.routes.draw do
  for_persona :reader do
    resources :posts, only: [:index, :show]
  end
  
  for_persona :author do
    resources :posts, only: [:index, :new, :create, :edit, :update, :show]
  end
  
  for_persona :unauthenticated do
    match '*path', to: 'sessions#new', via: :all
  end
end

```
