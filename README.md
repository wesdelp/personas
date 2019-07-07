# Personas
Personas makes your multi-tenanted Rails application more secure, stable, and easy to test. It works by bucketing end users into "personas" at the router level in order to segregate routes, views, controllers, and more. 

Devise integration is currently supported, with more to come soon.

## Setup
Add personas to your Gemfile:
```ruby
gem 'personas'
```

Install it:
```bash
bundle install
```

Personas provides a helpful generator for automating setup. 

Run the installation generator:
```bash
rails g personas:install
```
This creates 2 necessary files/directories:
- `config/initializers/personas.rb` file
  - Needed to hook into the Devise middleware
- `app/models/personas` directory
  - Where custom persona files must go

## Create a new persona
Personas also provides a generator to automate creating a new custom persona.

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

## Route Helpers

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

## FAQ
*Why would I use this gem?*

You have a Rails application with different interfaces for different user types. Personas allows you to break up your views/routes/controllers by persona in order to isolate their experiences. Avoid nesting conditionals in your views and excess authorization in your controllers.

*Can I use this in place of Devise/Clearance/etc?*

Personas is strictly low level authorization used to change application behavior by user type. Any authentication or more specific authorization will need to be handled outside this gem.
