# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.new(
      :nama                  => "Admin",
      :email                 => "admin@carfix.co.id",
      :password              => "123456",
      :password_confirmation => "123456",
      :admin                 => true
  )
  user.skip_confirmation!
  user.save!
  
19.times do |n|
  name  = "Pelamar#{n+1}"
  email = "example-#{n+1}@example.org"
  password = "password"
  user = User.new( nama:  name,
            email: email,
            password:              password,
            password_confirmation: password,
            admin: false)
  user.skip_confirmation!
  user.save!
end