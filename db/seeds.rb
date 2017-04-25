# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


 Jam.create([
  {
    :name => "I see Fire - Acoustic version",
    :song => "I See Fire by Ed Sheeran",
    :date  => DateTime.new(2017,4,25,17),
    :location => "Concord, CA",
    :owner_user_id => 1
  },
  {
    :name => "Sugar Maroon 5",
    :song => "Sugar by Maroon 5",
    :date  => DateTime.new(2017,4,27,12),
    :location => "Mountain View, CA",
    :owner_user_id => 1
  },
  {
    :name => "Uptown Funk",
    :song => "Uptown Funk by Bruno Mars",
    :date  => DateTime.new(2017,4,29,18),
    :location => "San Rafael, CA",
    :owner_user_id => 1
  },
  {
    :name => "Rockabye",
    :song => "Rockabye by Clean Bandit",
    :date  => DateTime.new(2017,5,1,10),
    :location => "Dublin, CA",
    :owner_user_id => 1
  }])