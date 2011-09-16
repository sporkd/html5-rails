Html5 Rails
=========================

Rewrite of compass-html5-boilerplate that decouples the compass CSS library and adds Rails asset pipeline integration.

Install
-------

for rails 3.1

```
# Gemfile
gem "haml"
gem "html5-rails", :git=>"https://github.com/sporkd/html5-rails.git"
group :assets do
	gem "compass", :git => "https://github.com/chriseppstein/compass.git", :branch => "rails31"
	gem "compass-html5", :git => "https://github.com/sporkd/compass-html5.git"
end
```
Configuration

```
$ rails g html5:install --syntax sass # --syntax is optional

# application.js
	//= require html5/boilerplate

# application.css.sass
	@import "boilerplate"
	+html5-boilerplate
```

(More soon)
