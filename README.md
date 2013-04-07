Html5 for Rails
=========================

Html5 for Rails projects based on [Html5 Boilerplate](http://html5boilerplate.com)
by Paul Irish, Divya Manian and many other [fine folks](https://github.com/h5bp/html5-boilerplate/contributors).

Installation
=========================

##### 1. In your Gemfile

```ruby
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'

  gem 'compass-h5bp'
end

gem 'jquery-rails'
gem 'html5-rails'

# Optional: to generate haml
# gem 'haml-rails'

# Optional: to generate slim
# gem 'slim-rails'
```

##### 2. Install your bundle

```
$ bundle install
```

##### 3. Run the generator

```
$ rails generate html5:install
```

##### (Here's what it does)

      create  config/compass.rb
      create  config/html5_rails.yml
      create  app/views/layouts/application.html.(erb|haml|slim)
      create  app/views/application
      create  app/views/application/_footer.html.(erb|haml|slim)
      create  app/views/application/_head.html.(erb|haml|slim)
      create  app/views/application/_header.html.(erb|haml|slim)
      create  app/views/application/_chromeframe.html.(erb|haml|slim)
       exist  app/assets/javascripts
      insert  app/assets/javascripts/application.js
        gsub  app/assets/javascripts/application.js
      create  app/assets/javascripts/polyfills.js
      remove  app/assets/stylesheets/application.css
      create  app/assets/stylesheets/application
      create  app/assets/stylesheets/application/index.css.scss
      create  app/assets/stylesheets/application/variables.css.scss
      create  app/assets/stylesheets/application/layout.css.scss
      create  app/assets/stylesheets/application/media_queries.css.scss

##### 4. And you're done!

      rails server


Options
=========================

To see other generators available run:

```
$ rails generate html5:layout --help
$ rails generate html5:partial --help
$ rails generate html5:assets --help
```

Google Analytics
=========================

By default your Google Analytics code snippet will be hidden until you set your Google Account ID.
You can do this by either setting `ENV['GOOGLE_ACCOUNT_ID']` or `google_account_id` in config/html5_rails.yml.

Notes
==========

[1] The `compass-h5bp` gem is not a runtime dependency, but it does need to be
included in your assets group for development and asset precompiling to work.

[2] If you use `--template-engine=haml` (or `haml-rails` gem), the install
generator will prompt to remove your application.html.erb layout so that
application.html.haml will be used instead.

[3] For the time being, you will want to add the following line to
config/production.rb so that polyfills are precompiled on deploy:

`config.assets.precompile += %w( polyfills.js )`


License
========

Copyright (c) 2010-2013 Peter Gumeson.
See [LICENSE](https://github.com/sporkd/html5-rails/blob/master/LICENSE) for full license.
