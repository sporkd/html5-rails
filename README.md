Html5 for Rails
=========================

Sensible Html5 defaults for Rails projects based on [Html5 Boilerplate](http://html5boilerplate.com)
by Paul Irish, Divya Manian and many other [fine folks](https://github.com/h5bp/html5-boilerplate/contributors).

(A rewrite of compass-html5-boilerplate that decouples the compass CSS library and adds Rails asset pipeline integration).

Installation
=========================

We're a bit light on documentation right now, but this should get you going...

In your Gemfile

```ruby
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'compass', '0.12.alpha.4'
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
---------------

[1] The `compass-h5bp` is not actually a dependency but it does need to be
included in your assets group for development and asset precompiling to work.

[2] If you use `--template-engine=haml` (or `haml-rails`), the install
generator will remove your application.html.erb layout and generate
application.html.haml.

[3] If you're upgrading from compass-html5-boilerplate you may need to
remove config/compass.rb before you can run the generators.

[4] Until the generator is done, you will want to add the following
line to config/production.rb to precompile assets on deploy:

`config.assets.precompile += %w( polyfills.js )`


License
========

Copyright (c) 2010-2012 Peter Gumeson.
See [LICENSE](https://github.com/sporkd/html5-rails/blob/master/LICENSE) for full license.
