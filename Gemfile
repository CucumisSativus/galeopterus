source 'https://rubygems.org'
source 'https://rails-assets.org'
ruby '2.1.2'
gem 'rails', '4.1.6'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
# gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0',          group: :doc
# gem 'spring',        group: :development

gem 'devise'
gem 'devise-i18n'
gem 'haml-rails'
gem 'pg'
# assets
gem 'rails-assets-bootstrap-sass'
gem 'rails-assets-select2'
gem 'jquery-ui-rails', '~> 5.0.3'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_21]
  gem 'html2haml'
  gem 'rails_layout'
end
group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rspec-rails'
  gem 'thin'
end
group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end
group :test do
  gem 'simplecov', require: false
  gem 'simplecov-rcov'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
end
