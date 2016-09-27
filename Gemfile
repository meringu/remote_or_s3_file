source 'https://rubygems.org'

gem 'chef'
gem 'chefspec'
gem 'test-kitchen'
gem 'kitchen-vagrant'

group :lint do
  gem 'foodcritic'
  gem 'rubocop'
  gem 'rainbow'
end

group :unit do
  gem 'berkshelf'
  gem 'fauxhai'
end

# https://github.com/chef/ffi-yajl/issues/81
gem 'ffi-yajl', '~> 2.2.3'
