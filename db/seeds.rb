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

maryuser = User.where(user_id: 'mary')
              .first_or_create!(
                name: 'Mary User',
                password_digest: BCrypt::Password.create('password'),
                admin: false
                )

# END - Create Users

# START - Creating authors and books
tolkien = Author.where(name: 'J.R.R. Tolkien')
  .first_or_create!(dob: '1892-01-03',
    nationality: 'British', awards: 'Blah',
    biography: 'Wrote Lord of the Rings',
    image_url: 'tolkien_pic.jpg')

larsson = Author.where(name: 'Stieg Larsson')
  .first_or_create!(dob: '1954-08-15',
    nationality: 'Swedish', awards: 'Blah',
    biography: 'Wrote "Girl with the Dragon Tattoo" series',
    image_url: 'larsson_pic.jpg')

moore = Author.where(name: 'Alan Moore')
  .first_or_create(dob: '1953-11-18',
    nationality: 'British', awards: 'Jack Kirby Award',
    biography: 'Alan Moore is an English writer primarily known for his work in comic books including Watchmen, V for Vendetta, and From Hell. Frequently described as the best graphic novel writer in history, he has been called "one of the most important British writers of the last fifty years".',
    image_url: 'Alan_Moore.jpg')

tolkien.books.where(title: 'The Hobbit').first_or_create!(isbn: '1234-567-8910',
      genre: 'fantasy', abstract: 'A hobbit goes on an unexpected journey.',
      pages: 250, image_cover_url: 'The_Hobbit.jpg',
      published_on: '1935-06-25', total_in_library: 2)

tolkien.books.where(title: 'Sir Gawain and the Green Knight').first_or_create!(isbn: '0345277600',
      genre: 'fantasy', abstract: 'A modern translation of the ancient tale',
      pages: 165, image_cover_url: 'Gawain_Green_Knight.jpg',
      published_on: '1975-06-05', total_in_library: 2)

tolkien.books.where(title: 'The Silmarillion').first_or_create!(isbn: '0395257301',
      genre: 'fantasy', abstract: 'The ancient legends of Middle-earth',
      pages: 365, image_cover_url: 'The_Silmarillion.jpg',
      published_on: '1977-03-05', total_in_library: 1)

larsson.books.where(title: 'The Girl With the Dragon Tattoo').first_or_create!(isbn: '9780307455352',
      genre: 'crime', abstract: 'Crusading publisher Mikael Blomkvist has decided...',
      pages: 644, image_cover_url: 'Girl_Tattoo.jpg',
      published_on: '2008-03-01', total_in_library: 3)

larsson.books.where(title: 'The Girl Who Played With Fire').first_or_create!(isbn: '978-0-307-47615-9',
      genre: 'crime', abstract: 'Crusading publisher Mikael Blomkvist has decided...',
      pages: 724, image_cover_url: 'Girl_Played_Fire.jpg',
      published_on: '2010-03-01', total_in_library: 1)

moore.books.where(title: 'Watchmen').first_or_create!(isbn: '9780283548848',
      genre: 'graphic novel', abstract: 'Who Watches the Watchment',
      pages: 200, image_cover_url: 'Watchmen.jpg',
      published_on: '1986-01-01', total_in_library: 2)

# END - Creating authors and books

# START - Creating reservations
# IMPORTANT - DATES are in YYYY-MM-DD format!
hobbit = Book.where( title: 'The Hobbit' ).first
fire = Book.where( title: 'The Girl Who Played With Fire').first
Reservation.where( user: joeuser, book: hobbit).first_or_create!( reserved_on: '2015-05-01', due_on: '2015-05-08')
Reservation.where( user: maryuser, book: hobbit).first_or_create!( reserved_on: '2015-04-01', due_on: '2015-04-08')
Reservation.where( user: maryuser, book: fire).first_or_create!( reserved_on: '2015-04-01', due_on: '2015-04-08')
# END - Creating reservations