# Generate a page to test that TailwindCSS & it's plugins are working
generate(:controller, "home", "index")
route "root 'home#index'"
