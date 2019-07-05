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
