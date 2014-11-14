# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Room.all.delete_all
User.all.delete_all

User.create(
	[
		{username: "Croissant",
			email: "croissant@bakery.br"},
		{username: "Bagel",
			email: "bagel@bakery.br"}
	]
	)

Room.create(
	[
		{price_in_pence: 30000,
			name: "Happy House",
			description: "Happy hour 24/7. (That was lame.)",
			address: "200 Pentonville Road London N1 9JP",
			latitude: 51.531443,
			longitude: -0.117477,
			phone_number: "+44 7756 600 896",
			no_of_rooms: 2,
			max_guests: 4,
			pets: false,
			used_id: User.first
		},
				{price_in_pence: 50000,
			name: "Happier House",
			description: "Happy hour 25/8. (That was lamer.)",
			address: "Kings Cross St Pancras Station",
			latitude: 51.531462,
			longitude: -0.124809,
			phone_number: "+44 7756 600 896",
			no_of_rooms: 20,
			max_guests: 8,
			pets: false,
			used_id: User.last
		}
	]
	)