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

tolkien = Author.where(name: 'J.R.R. Tolkien')
  .first_or_create!(dob: '01/03/1892',
    nationality: 'British', awards: 'Blah',
    biography: 'Wrote Lord of the Rings',
    image_url: 'tolkien_pic.jpg')

tolkien.books.where(title: 'The Hobbit').first_or_create!(isbn: '1234-567-8910',
      genre: 'fantasy', abstract: 'A hobbit goes on an unexpected journey.',
      pages: 250, image_cover_url: 'hobbit_cover.jpg',
      published_on: '06/25/1935', total_in_library: 2)
