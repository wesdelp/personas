# personas

## Setup

Personas provides a helpful generator for automating setup. 
```bash
rails g personas:install
```
This creates 2 necessary files/directories:
- `config/initializers/personas.rb` file
  - Needed to hook into the Devise middleware
- `app/models/personas` directory
  - Where custom persona files must go

## Create a new persona
Personas also provides a generator to creating a new custom persona. While this is not necessary, it is much more convenient.

```bash
rails g personas:create Admin
```

This creates multiple files/directories:
- `app/controllers/admin/` directory
  - along with an example controller
- `app/models/personas/admin.rb` file
- `app/views/admin/` directory
  - along with an example view file
- inserts `for_persona :admin do ... end` helper into `config/routes.rb`

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
