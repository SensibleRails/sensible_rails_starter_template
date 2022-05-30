######################################
#### Annotate Gem add Gem
#
insert_into_file "Gemfile",
  %(\n\tgem "annotate_gem", require: false),
  after: %(# gem "spring")

######################################
#### Letter Opener add Gem
#
insert_into_file "Gemfile",
  %(\n\tgem "letter_opener"),
  after: %(# gem "spring")

######################################
#### RSpec add Gem
#
insert_into_file "Gemfile",
  %(\n\tgem "fuubar"),
  after: %(gem "debug", platforms: %i[ mri mingw x64_mingw ])

insert_into_file "Gemfile",
  %(\n\tgem "rspec-rails"),
  after: %(gem "debug", platforms: %i[ mri mingw x64_mingw ])

######################################
#### standardrb add Gem
#
insert_into_file "Gemfile",
  %(\n\tgem "standardrb"),
  after: %(# gem "spring")

######################################
#### Letter Opener add Gem
#
