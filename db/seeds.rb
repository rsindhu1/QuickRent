# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = [{:title => '11 Catherine Street', :rating => 'G', :release_date => '25-Mar-2016'},
    	  {:title => '44 Schiller', :rating => 'R', :release_date => '26-Mar-2016'},
    	  {:title => '207', :rating => 'R', :release_date => '21-Mar-2016'},
      	  {:title => '209', :rating => 'PG-13', :release_date => '10-Apr-2016'},
      	  {:title => 'murray', :rating => 'PG-13', :release_date => '5-Apr-2016'},
  	 ]

users = [{:username => 'Kalyani', :sex => 'F', :password => 'KW'},
         {:username => 'Ankush', :sex => 'M', :password => 'AA'},
         {:username => 'Rasika', :sex => 'F', :password => 'RK'},
    ]


  
movies.each do |movie|
  Movie.create!(movie)
end

users.each do |user|
  User.create!(user)
end