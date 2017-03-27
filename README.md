# Market Place API

This application is created following the instructions of [Api On Rails](http://apionrails.icalialabs.com/book/frontmatter).


### ch01 Introduction

```
$ rails new market_place_api -T -d=postgresql

# Installing prax
$ sudo git clone git://github.com/ysbaddaden/prax.git /opt/prax
$ cd /opt/prax/
$ ./bin/prax install
$ cd ~/workspace/market_place_api
$ prax link
# prax start in .profile
```

### ch02 The API

```
# rails c
Mime::SET.collect(&:to_s)
rails g rspec:install
```

Gems that handles api verioning: [https://github.com/bploetz/versionist](https://github.com/bploetz/versionist)


### ch03 Presenting the users

```
gem 'devise'
rails g devise:install
rails g devise User
rake db:migrate

rails g controller users
mkdir -p spec/controllers/api/v1
mv spec/controllers/users_controller_spec.rb spec/controllers/api/v1
```