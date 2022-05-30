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

apply "add_gems.rb"

after_bundle do
  apply "update_configs.rb"

  directory "app", force: true
  directory "config", force: true

  rails_command "db:create db:migrate"

  run "annotate-gem"
  run "standardrb --fix"

  git add: "."
  git commit: "--quiet -a -m 'initial commit'"

  say set_color "\n###########################################################", :red, bold: true
  say set_color "Success!!", :green, bold: true
  say set_color "To run the application, cd into the new app directory and run: ./bin/dev", :cyan
end
