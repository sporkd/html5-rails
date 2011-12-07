Html5 for Rails
=========================

Sensible Html5 defaults for Rails projects based on [Html5 Boilerplate](http://html5boilerplate.com)
by Paul Irish, Divya Manian and many other [fine folks](https://github.com/h5bp/html5-boilerplate/contributors).

(A rewrite of compass-html5-boilerplate that decouples the compass CSS library and adds Rails asset pipeline integration).

Installation
=========================

We're a bit light on documentation right now, but this should get you going.

In your Gemfile

```ruby
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
  gem 'compass', '0.12.alpha.2'
  gem 'compass-h5bp'
end

gem 'jquery-rails'
gem 'haml-rails'
gem 'html5-rails', :git => 'git://github.com/sporkd/html5-rails.git'
```

Install

```
$ bundle install
```

Run generator

```
$ rails generate html5:install
```

Notes
---------------

[1] The install generator will remove your application.html.erb layout and
replace with application.html.haml. An erb option is in the works.

[2] The generators are not copying css or js assets yet,
so you'll want your app/assets directory to
[look something like this](https://github.com/sporkd/html5-rails/tree/master/app/assets/javascripts).

[3] I'm still organizing stuff to be as flexible as possible, so some
paths might change. Just make sure you re-run generators when upgrading.


License
========

Copyright (c) 2010-2011 Peter Gumeson.
See [LICENSE](https://github.com/sporkd/html5-rails/blob/master/LICENSE) for full license.