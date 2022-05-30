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

insert_into_file "Gemfile", %(\n\tgem "fuubar"),
  after: %(gem "debug", platforms: %i[ mri mingw x64_mingw ])

insert_into_file "Gemfile", %(\n\tgem "rspec-rails"),
  after: %(gem "debug", platforms: %i[ mri mingw x64_mingw ])

copy_file ".rspec"
