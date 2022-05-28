# 🌲 Add comments to your Gemfile with each dependency's description.
# NB: This should only be run once all gems have been added to your Gemfile

insert_into_file "Gemfile", %(gem "annotate_gem", require: false),
  after: "gem_group :development do"

after_bundle do
  run "annotate-gem"
end
