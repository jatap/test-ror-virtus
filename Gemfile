# encoding: utf-8
source 'https://rubygems.org'

gem 'rails', '3.2.14'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', platforms: :ruby

  gem 'uglifier', '>= 1.0.3'
end

# ------------------------------------------------------------------------------
# Production
# ------------------------------------------------------------------------------

group :production do
end

# ------------------------------------------------------------------------------
# Development
# ------------------------------------------------------------------------------

group :development do
  # Notifications
  gem 'ruby_gntp'
  gem 'growl'
  # Assets
  gem 'quiet_assets', '>= 1.0.2'
  # Errors
  gem 'better_errors', '>= 0.7.2'
  gem 'binding_of_caller', '>= 0.7.1', platforms: [:mri_19, :rbx]
  # Listeners
  gem 'guard'
  gem 'guard-bundler', '>= 1.0.0'
  gem 'guard-cucumber', '>= 1.4.0'
  gem 'guard-rails', '>= 0.4.0'
  gem 'guard-rspec', '>= 2.5.2'
  gem 'guard-spork'
  gem 'guard-livereload', require: false
  gem 'rack-livereload'
  gem 'guard-passenger'
  gem 'guard-rubocop'
  gem 'guard-yard'
  gem 'guard-brakeman'
  gem 'guard-cane'
  gem 'rb-inotify', '>= 0.9.0', require: false
  gem 'rb-fsevent', '>= 0.9.3', require: false
  gem 'rb-fchange', '>= 0.0.6', require: false
  # Code style checker, metrics
  gem 'rubocop', '0.13.1', require: false # era RuboCop: latest release on or before 2013-09-25
  # RuboCop 0.13.1 calls String#color; rainbow >= 2.0 dropped that monkey patch (undefined method `color')
  gem 'rainbow', '1.1.4', require: false
  # parser 2.0.0 (2013-10-05) postdates the era and makes RuboCop 0.13.1 warn 'spans more than one line'
  gem 'parser', '2.0.0.pre8', require: false
  gem 'cane'
  gem 'rcodetools'
  gem 'flay'
  gem 'flog'
  gem 'guard-flog', git: 'git://github.com/pericles/guard-flog.git'
  # Documentation
  gem 'yard'
  gem 'redcarpet'
  # UML Diagrams
  gem 'rails-erd'
  # Testing
  gem 'rspec-rails' # , '>= 2.12.2'
  gem 'spork-rails'
  gem 'factory_girl_rails' # , '>= 4.2.0'
  # Security checks
  gem 'brakeman'
end

# ------------------------------------------------------------------------------
# Test
# ------------------------------------------------------------------------------

group :test do
  # Notifications
  gem 'ruby_gntp'
  gem 'growl'
  # Testing
  gem 'rspec-rails' # , '>= 2.12.2'
  gem 'cucumber-rails', require: false
  gem 'database_cleaner', '~> 1.0.1'
  gem 'simplecov', require: false
  gem 'simplecov-gem-adapter'
  gem 'launchy' # , '>= 2.2.0'
  gem 'capybara' # , '1.1.2'
  gem 'webrat'
  gem 'spork-rails'
  gem 'factory_girl_rails' # , '>= 4.2.0'
  gem 'email_spec' # , '>= 1.4.0'
  gem 'appraisal'
  gem 'rspec-nc'
  gem 'rspec-abhakungszeichen-formatter'
  gem 'nyan-cat-formatter'
  gem 'fuubar'
  gem 'rcodetools'
  # Travis requirements
  gem 'rake'
end

# ------------------------------------------------------------------------------
# Console
# ------------------------------------------------------------------------------
group :console do
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-doc'

  # Gems commented while coding in RubyMine
  gem 'pry-remote'
  gem 'pry-remote-auto'
  gem 'pry-debugger'

  gem 'awesome_print'
  gem 'colorize'
end
gem 'rails-console-tweaks'

# ------------------------------------------------------------------------------
# Debug
# ------------------------------------------------------------------------------

group :debug do
  gem 'debugger'
end

# ------------------------------------------------------------------------------
# Others
# ------------------------------------------------------------------------------

# Database
gem 'sqlite3'

# Testing
gem 'ffaker'

# Crypt
gem 'bcrypt-ruby', '3.0.1'

# JQuery
gem 'jquery-rails', '~> 2.1'

# Model
gem 'virtus', '~> 0.5.4'
