repo_url = 'https://raw.github.com/muratayusuke/rails-template/master'
@app_name = app_name

def get_and_gsub(source_path, local_path)
  get source_path, local_path
  gsub_file local_path, /%app_name%/, @app_name
end

# gem settings
gem 'haml-rails'
gem 'dotenv-rails'
gem 'whenever', require: false
gem 'mtracker'
gem 'meta-tags'
gem 'unicorn-rails'

gem_group :assets do
  gem 'bourbon'
  gem 'neat'
  gem 'bitters'
end

gem_group :development, :test do
  gem 'awesome_print'
  gem 'pry-rails'
  gem 'guard-rails'
  gem 'guard-unicorn', '>= 0.1.3'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'turnip'
  gem 'rubocop'
  gem 'rails_best_practices'
  gem 'bullet'
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller'
end

gem_group :deployment do
  gem 'capistrano-rails', require: false
  gem 'capistrano-rbenv', require: false
  gem 'capistrano3-unicorn', require: false
  gem 'cap-ec2', require: false
end

%w(.gitignore Capfile Guardfile config/unicorn.rb config/application.rb .rubocop.yml).each do |f|
  remove_file f
  get_and_gsub "#{repo_url}/#{f}", f
end

inside @app_name do
  run 'bundle install'
end

# root
generate :controller, 'home', 'index'
route "root to: 'home#index'"

# sass
remove_file 'app/assets/stylesheets/application.css'
get "#{repo_url}/app/assets/stylesheets/application.scss", 'app/assets/stylesheets/application.scss'

# layout
remove_file 'app/views/layouts/application.html.erb'
get "#{repo_url}/app/views/layouts/application.html.haml", 'app/views/layouts/application.html.haml'
