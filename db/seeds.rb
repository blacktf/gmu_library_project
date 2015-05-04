# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create user(s)
#require 'bcrypt'

# START - Create Users
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

maryuser = User.where(user_id: 'Mary')
              .first_or_create!(
                name: 'Mary User',
                password_digest: BCrypt::Password.create('password'),
                admin: false
                )

# END - Create Users

# START - Creating authors and books
tolkien = Author.where(name: 'J.R.R. Tolkien')
  .first_or_create!(dob: '01/03/1892',
    nationality: 'British', awards: 'Blah',
    biography: 'Wrote Lord of the Rings',
    image_url: 'tolkien_pic.jpg')

larsson = Author.where(name: 'Stieg Larsson')
  .first_or_create!(dob: '08/15/1954',
    nationality: 'Swedish', awards: 'Blah',
    biography: 'Wrote "Girl with the Dragon Tattoo" series',
    image_url: 'larsson_pic.jpg')

tolkien.books.where(title: 'The Hobbit').first_or_create!(isbn: '1234-567-8910',
      genre: 'fantasy', abstract: 'A hobbit goes on an unexpected journey.',
      pages: 250, image_cover_url: 'hobbit_cover.jpg',
      published_on: '06/25/1935', total_in_library: 2)

larsson.books.where(title: 'The Girl Who Played With Fire').first_or_create!(isbn: '978-0-307-47615-9',
      genre: 'crime', abstract: 'Crusading publisher Mikael Blomkvist has decided...',
      pages: 724, image_cover_url: 'girl_played_fire_cover.jpg',
      published_on: '03/01/2010', total_in_library: 1)

# END - Creating authors and books

# START - Creating reservations
# IMPORTANT - DATES are in DD/MM/YYYY format!
hobbit = Book.where( title: 'The Hobbit' ).first
fire = Book.where( title: 'The Girl Who Played With Fire').first
Reservation.where( user: joeuser, book: hobbit).first_or_create!( reserved_on: '2015-05-01', due_on: '2015-05-08')
Reservation.where( user: maryuser, book: hobbit).first_or_create!( reserved_on: '2015-04-01', due_on: '2015-04-08')
Reservation.where( user: maryuser, book: fire).first_or_create!( reserved_on: '2015-04-01', due_on: '2015-04-08')
# END - Creating reservations