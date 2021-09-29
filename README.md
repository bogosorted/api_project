#  <div align="center">     API PROJECT
Rails API-only application that simulates appointment scheduling.

## Description

The project simulates an API whose main objective is to be a service for creating<br /> visits queries. user authentication is done using [bcrypt](https://rubygems.org/gems/bcrypt/versions/3.1.11?locale=pt-BR) and.To maintain the session,<br /> [jwt-token](https://rubygems.org/gems/jwt/versions/1.5.4) is used. Unit tests are done using an [rspec](https://rubygems.org/gems/rspec/versions/3.4.0) gem, and the test flow is<br /> available in pt-br in this [document](https://docs.google.com/document/d/1e8h8Z8MrcH8e3NhVCJ2gG0jPSRBpRiJiCDQNCz76sLA/edit?usp=sharing).

## Getting Started 👌
### Dependencies

* [Rails 6](https://rubyonrails.org/) 
* [Ruby](https://www.ruby-lang.org/pt/)
* [Node.js](https://nodejs.org/en/)
* [Yarn](https://yarnpkg.com/)


### Executing program


* Run bundle install
```
# to install all repository gems
bundle install
```
* add a jwt_secret parameter and add yo in credentials
```
# you can choose any editor you want
EDITOR=nano rails credentials:edit
```
![Screenshot_30](https://user-images.githubusercontent.com/48594379/135355206-450ae9de-9b1f-4fb8-a351-ef998b926467.png)

* create and migrate the database
```
rails db:create
rails db:migrate
```
* run locally the server
```
rails s
```

