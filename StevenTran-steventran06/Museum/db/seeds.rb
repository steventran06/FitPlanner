# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Painting.delete_all

puts 'Deleting existing paintings and adding seed paintings'

Painting.create! artist: "Picasso",
  museum: 'The Louvre', image: 'https://rawartint.files.wordpress.com/2008/11/picasso_femme_dalger.jpg', user_id: '1'

Painting.create! artist: 'Jackson Pollock',
  museum: 'Pollock-Krasner House', image: 'http://www.ibiblio.org/wm/paint/auth/pollock/pollock.number-8.jpg', user_id: '1'

Painting.create! artist: "George W. Bush",
  museum: 'George W. Bush Presidential Library and Museum', image: 'http://frontburner.dmagazine.com/wp-content/uploads/2014/02/bush.jpg', user_id: '1'