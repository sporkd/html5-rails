Html5 Rails
=========================

Rewrite of compass-html5-boilerplate that decouples the compass CSS library and adds Rails asset pipeline integration.

Install
-------

for rails 3.1

```
# Gemfile
gem "haml"
group :assets do
	gem "compass"
	gem "html5-rails", :git=>"https://github.com/sporkd/html5-rails.git"
end
```
run

```
$ rails g html5:install --syntax sass

# application.js
//= require html5/boilerplate

```


(More soon)
