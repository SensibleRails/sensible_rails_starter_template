# frozen_string_literal: true

# Install Tailwind JS stuff and it's plugins
run "yarn add tailwindcss @tailwindcss/typography @tailwindcss/forms @tailwindcss/aspect-ratio @tailwindcss/line-clamp"
run "yarn add postcss postcss-cli postcss-import postcss-nesting postcss-preset-env"
remove_file "tailwind.config.js"
copy_file "tailwind.config.js", force: true

copy_file "postcss.config.js", force: true
gsub_file "package.json",
  %("build:css": "tailwindcss -i ./app/assets/stylesheets/application.tailwind.css -o ./app/assets/builds/application.css --minify"),
  %("build:css": "tailwindcss --postcss -i app/assets/stylesheets/application.css -o ./app/assets/builds/application.css --minify")
