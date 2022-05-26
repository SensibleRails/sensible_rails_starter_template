# SensibleRails - Starter Template
      
SensibleRails is template to help you bootstrap a new Ruby on Rails application and focus on development.

___

### Usage:

```bash
rails new <app_name> -d postgresql -j esbuild -c tailwind --skip-test -m "https://raw.githubusercontent.com/davidteren/basic_rails_starter_template/main/template.rb"
```

Start the server, js build and css build process by simply running the following in the project root:
```bash
cd <app_name>
./bin/dev
```
                    
## Whats' in the box
 
### Production 

- [Rails 7](https://rubyonrails.org/) - Compress the complexity of modern web apps.

### Frontend

- [Hotwire](https://hotwired.dev/) - an alternative approach to building modern web applications without using much JavaScript by sending HTML instead of JSON over the wire.
  - [Turbo](https://turbo.hotwired.dev/) - The speed of a single-page web application without having to write any JavaScript.
  - [Stimulus](https://stimulus.hotwired.dev/) - A modest JavaScript framework for the HTML you already have.
 
- [TailwindCSS](https://tailwindcss.com/) - Rapidly build modern websites without ever leaving your HTML.
  - [typography plugin](https://tailwindcss.com/docs/typography-plugin) - Beautiful typographic defaults for HTML you don't control.
  - [forms plugin](https://github.com/tailwindlabs/tailwindcss-forms) - A plugin that provides a basic reset for form styles that makes form elements easy to override with utilities.
  - [aspect-ratio plugin](https://github.com/tailwindlabs/tailwindcss-aspect-ratio) - A plugin that provides a composable API for giving elements a fixed aspect ratio.
  - [line-clamp plugin](https://github.com/tailwindlabs/tailwindcss-line-clamp) - A plugin that provides utilities for visually truncating text after a fixed number of lines.

### Development
                 
#### Testing
  
 - [RSpec](https://github.com/rspec/rspec-rails) - rspec-rails brings the RSpec testing framework to Ruby on Rails as a drop-in alternative to its default testing framework, Minitest.
 - [Fuubar](https://github.com/thekompanee/fuubar) - fuubar is an instafailing RSpec formatter that uses a progress bar instead of a string of letters and dots as feedback.

#### Linting

  - [Standard - Ruby style guide, linter, and formatter](https://github.com/testdouble/standard) - 🌟 Ruby Style Guide, with linter & automatic code fixer

#### Utilities
          
- [Annotate (aka AnnotateModels)](https://github.com/ctran/annotate_models) - Annotate Rails classes with schema and routes info
- [letter_opener](https://github.com/ryanb/letter_opener) - Preview mail in the browser instead of sending.

## Coming soon...

- [ ] [Devise](https://github.com/heartcombo/devise) - Flexible authentication solution for Rails with Warden.
- [ ] RSpec System Tests 
- [ ] [Anyway Config](https://github.com/palkan/anyway_config) - Configuration library for Ruby gems and applications
- [ ] FactoryBot
- [ ] Faker
- [ ] Friendly Id
- [ ] ViewComponent
- [ ] Lookbook
- [ ] Interactor
- [ ] SimpleCov
- [ ] Rails ERD
- [ ] Bundle audit
- [ ] Pre commit hooks (husky/overcommit )
- [ ] Reek
- [ ] Add a PR readme - [see here](https://github.com/fastruby/rails-template/blob/main/pull_request_template.md)
- [ ] StandardJS
- [ ] Avo Admin
- [ ]
 
    
### EXAMPLES

 Several either included examples or Generators to show the use of;
 - Stimulus
 - Turbo
 - RSpec

> if we use examples they could be namespaces with a cleanup generator to tear them down.

### Docs

Some form of in app docs space.

 - Docs for usage of this template
 - Docs in directories explaning stuff & links to good resources
 - Docs where the dev(s) can add their own stuff

> Maybe there's a neat lib that can be used 

   

## Alternatives
   
  #### From excid3 (Chris) at GoRails 
- [Jumpstart](https://github.com/excid3/jumpstart) - Easily jumpstart a new Rails application with a bunch of great features by default 
- [Jumpstart Pro](https://jumpstartrails.com/) - Jumpstart Pro is the best Ruby on Rails SaaS template out there. Focus on your business, not on the boilerplate.
- [RailsBytes](https://railsbytes.com/) - Ruby on Rails templates allow you to add features to both old and new apps. Check out our repository of templates for adding everything from authentication to error monitoring to your apps.

#### From Matt Brictson
- [mattbrictson/rails-template](https://github.com/mattbrictson/rails-template) - App template for Rails 7 projects; best practices for TDD, security, deployment, and developer productivity. Now with optional Vite integration! ⚡️

### Ombulabs

- [fastruby/rails-template](https://github.com/fastruby/rails-template) - Rails Application Template for Ombulabs projects

### Rubidium

- [Rubidium](https://www.rubidium.io/) - Add complex functionality to your application quickly. Open documentation on what you're running, nothing hidden.

### thoughtbot Inc

- [suspenders](https://github.com/thoughtbot/suspenders) - A Rails template with our standard defaults, ready to deploy to Heroku.
