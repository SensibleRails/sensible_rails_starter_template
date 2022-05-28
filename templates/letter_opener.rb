gem_group :development do
  gem "letter_opener"
end

letter_opener_config = "
   config.action_mailer.delivery_method = :letter_opener

   config.action_mailer.perform_deliveries = true
  ".strip

insert_into_file "config/environments/development.rb", "\n\n#{letter_opener_config}",
  after: "config.action_mailer.perform_caching = false"
