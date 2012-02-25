Html5 for Rails
=========================

Html5 for Rails projects based on [Html5 Boilerplate](http://html5boilerplate.com)
by Paul Irish, Divya Manian and many other [fine folks](https://github.com/h5bp/html5-boilerplate/contributors).

(Also, a rewrite of compass-html5-boilerplate that adds Rails asset pipeline integration).

Installation
=========================

In your Gemfile

```ruby
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'compass-rails'
  gem 'compass-h5bp'
end

gem 'haml-rails' # Optional - to generate haml

gem 'jquery-rails'
gem 'html5-rails'
```

Install

```
$ bundle install
```

Run generator

```
$ rails generate html5:install
```

Options
=========================

To see other generators available:

```
$ rails generate html5:layout --help
$ rails generate html5:partial --help
$ rails generate html5:assets --help
```


Notes
==========

[1] The `compass-h5bp` gem is not actually a dependency but it does need to be
included in your assets group for development and asset precompiling to work.

[2] If you use `--template-engine=haml` (or `haml-rails`), the install
generator will remove your application.html.erb layout so that
application.html.haml.can be seen.

[3] If you're upgrading from compass-html5-boilerplate you may need to
remove config/compass.rb before you can run the generators.

[4] For the time being, you will want to add the following line to
config/production.rb so that polyfills are precompiled on deploy:

`config.assets.precompile += %w( polyfills.js )`


License
========

Copyright (c) 2010-2012 Peter Gumeson.
See [LICENSE](https://github.com/sporkd/html5-rails/blob/master/LICENSE) for full license.
