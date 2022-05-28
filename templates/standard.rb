insert_into_file "Gemfile", %(gem "standardrb"),
  after: "gem_group :development do"

after_bundle do
  gsub_file "config/environments/production.rb", "ActiveSupport::Logger.new(STDOUT)",
    "ActiveSupport::Logger.new($stdout)"
  gsub_file "config/puma.rb", 'max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }',
    'max_threads_count = ENV.fetch("RAILS_MAX_THREADS", 5)'
  gsub_file "config/puma.rb", 'port ENV.fetch("PORT") { 3000 }', 'port ENV.fetch("PORT", 3000)'
  run "standardrb --fix"
end
