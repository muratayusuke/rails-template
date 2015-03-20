repo_url = 'https://raw.github.com/muratayusuke/rails_template/master'
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

gem_group :assets do
  gem 'bourbon'
  gem 'neat'
  gem 'bitters'
end

gem_group :deployment do
  gem 'pry'
  gem 'guard-unicorn', '>= 0.1.3'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'turnip'
  gem 'rubocop'
  gem 'rails_best_practices'
  gem 'bullet'
  gem 'capistrano-rails', require: false
  gem 'capistrano-rbenv', require: false
  gem 'capistrano3-unicorn', require: false
  gem 'cap-ec2', require: false
end

%w(.gitignore Capfile Guardfile).each do |f|
  get "#{repo_url}/#{f}", f
end
