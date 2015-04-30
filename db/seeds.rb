# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create user(s)
#require 'bcrypt'
aleverett = User.where(user_id: 'aleverett')
                .first_or_create!(
                  name: 'Al Everett',
                  password_digest: BCrypt::Password.create('secret'),
                  admin: true
                )

joeuser = User.where(user_id: 'joe')
              .first_or_create!(
                name: 'Joe User',
                password_digest: BCrypt::Password.create('password'),
                admin: false
                )

admin = User.where(user_id: 'admin')
                .first_or_create!(
                  name: 'Admin User',
                  password_digest: BCrypt::Password.create('secret'),
                  admin: true
                )
