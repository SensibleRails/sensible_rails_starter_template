# SensibleRails - Starter Template
      
SensibleRails is template to help you bootstrap a new Ruby on Rails application and focus on development.

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

#### Linting

  - [Standard - Ruby style guide, linter, and formatter](https://github.com/testdouble/standard) - 🌟 Ruby Style Guide, with linter & automatic code fixer

#### Utilities
          
- [Annotate (aka AnnotateModels)](https://github.com/ctran/annotate_models) - Annotate Rails classes with schema and routes info
- [letter_opener](https://github.com/ryanb/letter_opener) - Preview mail in the browser instead of sending.

## Coming soon...

- [ ] Devise 
