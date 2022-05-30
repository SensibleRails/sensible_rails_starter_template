######################################
#### Letter Opener configuration
#
letter_opener_config = "
   config.action_mailer.delivery_method = :letter_opener

   config.action_mailer.perform_deliveries = true
  ".strip
insert_into_file "config/environments/development.rb", "\n\n#{letter_opener_config}",
  after: "config.action_mailer.perform_caching = false"

######################################
#### RSpec configuration
#
rspec_generator_config = "

  # Configure RSpec generators
  config.generators do |config|
    config.channel_spec false
    config.controller_spec false # Use request specs -> https://stackoverflow.com/questions/40851705/controller-specs-vs-request-specs
    config.feature_spec false # Use system tests -> https://stackoverflow.com/questions/49910032/difference-between-feature-spec-and-system-spec
    config.generator_spec true
    config.helper_spec true
    config.integration_spec true
    config.job_spec true
    config.mailbox_spec true
    config.mailer_spec true
    config.model_spec true
    config.request_spec true
    config.scaffold_spec true
    config.system_spec true
    config.view_spec true
  end
".strip

insert_into_file "config/application.rb", "  #{rspec_generator_config}\n\n",
  after: "config.generators.system_tests = nil"

######################################
#### standardrb configuration
#
gsub_file "config/environments/production.rb", "ActiveSupport::Logger.new(STDOUT)",
  "ActiveSupport::Logger.new($stdout)"
gsub_file "config/puma.rb", 'max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }',
  'max_threads_count = ENV.fetch("RAILS_MAX_THREADS", 5)'
gsub_file "config/puma.rb", 'port ENV.fetch("PORT") { 3000 }', 'port ENV.fetch("PORT", 3000)'

######################################
#### TailwindCSS install & configuration
#
packages = "
   postcss \\
   postcss-cli \\
   postcss-import \\
   postcss-nesting \\
   postcss-preset-env \\
   tailwindcss \\
   @tailwindcss/typography \\
   @tailwindcss/forms \\
   @tailwindcss/aspect-ratio \\
   @tailwindcss/line-clamp
"

run "yarn add #{packages}"

copy_file "tailwind.config.js", force: true

copy_file "postcss.config.js", force: true

gsub_file "package.json",
  %("build:css": "tailwindcss -i ./app/assets/stylesheets/application.tailwind.css -o ./app/assets/builds/application.css --minify"),
  %("build:css": "tailwindcss --postcss -i app/assets/stylesheets/application.css -o ./app/assets/builds/application.css --minify")

######################################
#### configuration
#
