# Market Place API

This application is created following the instructions of [Api On Rails](http://apionrails.icalialabs.com/book/frontmatter) by Abraham Kuri Vargas.


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

```
$ rails c
User.create({email: "example@marketplace.com",
                          password: "12345678",
                          password_confirmation: "12345678"})
$ curl -H 'Accept: application/vnd.marketplace.v1' \
            http://api.market_place_api.dev/users/1
{"id":1,"email":"example@marketplace.com","created_at":"2017-03-27T13:25:05.991Z","updated_at":"2017-03-27T13:25:05.991Z"}
```
Unable to install `gem 'sabisu-rails'`. Created an issue for compatibility issue with Rails 5.


### ch04 Refactoring Tests

Created files under the directory `/spec/support/`

### ch05 Authentication Users

```
# app/models/user.rb

  validates :auth_token, uniqueness: true
  before_create :generate_authentication_token!

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end
```

```
rails g controller sessions
$ mv app/controllers/sessions_controller.rb app/controllers/api/v1
$ mv spec/controllers/sessions_controller_spec.rb spec/controllers/api/v1
```

### ch06 User products

```
rails g model Product title:string price:decimal published:boolean user_id:integer:index
```

The products endpoint is not adding the `products:` key in the index response as expected by the test 

`before_create` trigger in called after validation in Rails 5. I had to use `  before_validation :generate_authentication_token!, on: :create` instead.

Generate factory in development: `20.times { FactoryGirl.create :product }`

### ch07 JSON with Active Model Serializers

```
rails g serializer user
```

### ch08 Placing Orders
```
rails generate model order user:references total:decimal
rails generate model placement order:references product:references
```