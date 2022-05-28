require "bundler"
require "json"

# Copied from: https://github.com/mattbrictson/rails-template
# Add this template directory to source_paths so that Thor actions like
# copy_file and template resolve against our source files. If this file was
# invoked remotely via HTTP, that means the files are not present locally.
# In that case, use `git clone` to download them to a local temporary dir.
def add_template_repository_to_source_path
  if __FILE__.match?(%r{\Ahttps?://})
    require "tmpdir"
    source_paths.unshift(tempdir = Dir.mktmpdir("sensible_rails-"))
    at_exit { FileUtils.remove_entry(tempdir) }
    git clone: [
      "--quiet",
      "https://github.com/davidteren/basic_rails_starter_template.git",
      tempdir
    ].map(&:shellescape).join(" ")
    if (branch = __FILE__[%r{jumpstart/(.+)/template.rb}, 1])
      Dir.chdir(tempdir) { git checkout: branch }
    end
  else
    source_paths.unshift(File.dirname(__FILE__))
  end
end

add_template_repository_to_source_path

# Configure the rspec generators
apply("templates/rspec_generator_config.rb")

comment_lines "Gemfile", /jbuilder/

# gem "devise"

gem_group :development, :test do
  gem "rspec-rails"
  gem "fuubar"
end

gem_group :development do
  gem "annotate"
  gem "standardrb"
end

after_bundle do
  # Install Tailwind JS stuff and it's plugins
  run "yarn add tailwindcss @tailwindcss/typography @tailwindcss/forms @tailwindcss/aspect-ratio @tailwindcss/line-clamp"
  run "yarn add postcss postcss-cli postcss-import postcss-nesting postcss-preset-env"
  remove_file "tailwind.config.js"
  copy_file "tailwind.config.js", force: true

  copy_file ".rspec"

  # generate "devise:install"

  # 3. Ensure you have flash messages in app/views/layouts/application.html.erb.
  #   For example:
  #
  #   <p class="notice"><%= notice %></p>
  #      <p class="alert"><%= alert %></p>
  #
  #  4. You can copy Devise views (for customization) to your app by running:
  #
  #        rails g devise:views

  # Generate a page to test that TailwindCSS & it's plugins are working
  generate(:controller, "home", "index")
  route "root 'home#index'"

  directory "app", force: true
  directory "config", force: true

  copy_file "postcss.config.js", force: true
  gsub_file "package.json",
    %("build:css": "tailwindcss -i ./app/assets/stylesheets/application.tailwind.css -o ./app/assets/builds/application.css --minify"),
    %("build:css": "tailwindcss --postcss -i app/assets/stylesheets/application.css -o ./app/assets/builds/application.css --minify")

  # generate(:devise, "User")

  # Standardrb
  gsub_file "config/environments/production.rb", "ActiveSupport::Logger.new(STDOUT)",
    "ActiveSupport::Logger.new($stdout)"
  gsub_file "config/puma.rb", 'max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }',
    'max_threads_count = ENV.fetch("RAILS_MAX_THREADS", 5)'
  gsub_file "config/puma.rb", 'port ENV.fetch("PORT") { 3000 }', 'port ENV.fetch("PORT", 3000)'
  run "standardrb --fix"

  rails_command "db:create db:migrate"

  git add: "."
  git commit: "--quiet -a -m 'initial commit'"

  say set_color "\n###########################################################", :red, bold: true
  say set_color "Success!!", :green, bold: true
  say set_color "To run the application,in the app directory run: ./bin/dev", :cyan
end
