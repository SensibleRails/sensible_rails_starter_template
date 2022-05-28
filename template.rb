require "bundler"
require "json"
require "pry"

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

comment_lines "Gemfile", /jbuilder/

apply("templates/rspec.rb")
apply("templates/letter_opener.rb")
apply("templates/standard.rb")

after_bundle do
  apply("templates/tailwindcss.rb")

  # generate(:devise, "User")

  rails_command "db:create db:migrate"

  git add: "."
  git commit: "--quiet -a -m 'initial commit'"

  say set_color "\n###########################################################", :red, bold: true
  say set_color "Success!!", :green, bold: true
  say set_color "To run the application,in the app directory run: ./bin/dev", :cyan
end
