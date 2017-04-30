movies = [
  {
    "imdb_key" => 'tt1535109',
    "runtime" => 134,
    "year" => 2013,
    "mpaa" => 'PG-13',
    "title" => 'Captain Phillips',
    "poster" => 'capt_phillips.jpg',
    "plot" => 'The true story of Captain Richard Phillips and the 2009 hijacking by Somali pirates of the U.S.-flagged MV Maersk Alabama, the first American cargo ship to be hijacked in two hundred years.'
  },
  {
    "imdb_key" => 'tt0107290',
    "runtime" => 127,
    "year" => 1993,
    "mpaa" => 'PG-13',
    "title" => 'Jurassic Park',
    "poster" => 'jurassic_park.jpg',
    "plot" => "During a preview tour, a theme park suffers a major power breakdown that allows its cloned dinosaur exhibits to run amok."
  },
  {
    "imdb_key" => 'tt0796366',
    "runtime" => 127,
    "year" => 2009,
    "mpaa" => 'PG-13',
    "title" => 'Star Trek',
    "poster" => 'star_trek.jpg',
    "plot" => "The brash James T. Kirk tries to live up to his father's legacy with Mr. Spock keeping him in check as a vengeful Romulan from the future creates black holes to destroy the Federation one planet at a time."
  },
  {
    "imdb_key" => 'tt0369610',
    "runtime" => 124,
    "year" => 2015,
    "mpaa" => 'PG-13',
    "title" => 'Jurassic World',
    "poster" => 'jurassic_world.jpg',
    "plot" => 'A new theme park, built on the original site of Jurassic Park, creates a genetically modified hybrid dinosaur, which escapes containment and goes on a killing spree.'
  },
  {
    "imdb_key" => 'tt1210166',
    "runtime" => 133,
    "year" => 2011,
    "mpaa" => 'PG-13',
    "title" => 'Moneyball',
    "poster" => 'moneyball.jpg',
    "plot" => "Oakland A's general manager Billy Beane's successful attempt to assemble a baseball team on a lean budget by employing computer-generated analysis to acquire new players."
  },
  {
    "imdb_key" => 'tt0443272',
    "runtime" => 150,
    "year" => 2012,
    "mpaa" => 'PG-13',
    "title" => 'Lincoln',
    "poster" => 'lincoln.jpg',
    "plot" => "As the Civil War continues to rage, America's president struggles with continuing carnage on the battlefield as he fights with many inside his own cabinet on the decision to emancipate the slaves."
  },
  {
    "imdb_key" => 'tt3263904',
    "runtime" => 96,
    "year" => 2016,
    "mpaa" => 'PG-13',
    "title" => 'Sully',
    "poster" => 'sully.jpg',
    "plot" => "The story of Chesley Sullenberger, an American pilot who became a hero after landing his damaged plane on the Hudson River in order to save the flight's passengers and crew."
  },

  {
    "imdb_key" => 'tt0082971',
    "runtime" => 115,
    "year" => 1981,
    "mpaa" => 'PG',
    "title" => 'Raiders of the Lost Ark',
    "poster" => 'raiders.jpg',
    "plot" => 'Archaeologist and adventurer Indiana Jones is hired by the US government to find the Ark of the Covenant before the Nazis.'
  },
  {
    "imdb_key" => 'tt2488496',
    "runtime" => 136,
    "year" => 2015,
    "mpaa" => 'PG',
    "title" => 'Star Wars: The Force Awakens',
    "poster" => 'star_wars.jpg',
    "plot" => 'Three decades after the defeat of the Galactic Empire, a new threat arises. The First Order attempts to rule the galaxy and only a ragtag group of heroes can stop them, along with the help of the Resistance.'
  },
  {
    "imdb_key" => 'tt0112384',
    "runtime" => 140,
    "year" => 1995,
    "mpaa" => 'PG',
    "title" => 'Apollo 13',
    "poster" => 'apollo_13.jpg',
    "plot" => 'NASA must devise a strategy to return Apollo 13 to Earth safely after the spacecraft undergoes massive internal damage putting the lives of the three astronauts on board in jeopardy.'
  },
  {
    "imdb_key" => 'tt0162222',
    "runtime" => 143,
    "year" => 2000,
    "mpaa" => 'PG-13',
    "title" => 'Cast Away',
    "poster" => 'cast_away.jpg',
    "plot" => 'A FedEx executive must transform himself physically and emotionally to survive a crash landing on a deserted island.'
  },
  {
    "imdb_key" => 'tt2015381',
    "runtime" => 121,
    "year" => 2014,
    "mpaa" => 'PG-13',
    "title" => 'Guardians of the Galaxy',
    "poster" => 'guardians.jpg',
    "plot" => 'A group of intergalactic criminals are forced to work together to stop a fanatical warrior from taking control of the universe.'
  }
]

# moved actors above here
actors = ["Tom Hanks", "Catherine Keener", "Barkhad Abdi",
"Sam Neill", "Laura Dern", "Jeff Goldblum",
"Chris Pine", "Zachary Quinto", "Leonard Nimoy",
"Chris Pratt", "Bryce Dallas Howard", "Irrfan Khan",
"Brad Pitt", "Jonah Hill", "Philip Seymour Hoffman",
"Daniel Day-Lewis", "Sally Field", "David Strathairn",
"Tom Hanks", "Aaron Eckhart", "Valerie Mahaffey",
"Harrison Ford", "Karen Allen", "Paul Freeman",
"Mark Hamill", "Carrie Fisher",
"Bill Paxton", "Kevin Bacon",
"Paul Sanchez", "Lari White",
"Zoe Saldana", "Dave Bautista"]

#--------------------------------------------------------
roles = {"Apollo 13" => ["Tom Hanks", "Kevin Bacon", "Bill Paxton"]}
#--------------------------------------------------------

Actor.delete_all
actors.each do |actor_name|
  Actor.create name: actor_name
end


Movie.delete_all

movies.each do |movie_data|
  m = Movie.new
  m.imdb_key = movie_data["imdb_key"]
  m.title = movie_data["title"]
  m.plot = movie_data["plot"]
  m.runtime = movie_data["runtime"]
  m.year = movie_data["year"]
  m.mpaa = movie_data["mpaa"]
  m.poster_url = movie_data["poster"]
  m.save
# ----------------------------------------------
  if roles[m.title]
    roles[m.title].each do |n|
      Role.create movie: m, player: Actor.find_by(name: n)
    end
  else
    3.times do
      Role.create movie: m, player: Actor.sample
    end
  end
  # ----------------------------------------------------
end

print "There are now #{Movie.count} movies in the database.\n"


directors = ["Ron Howard", "Paul Greengrass", "Robert Zemeckis",
              "James Gunn", "Colin Trevorrow", "Bennett Miller",
              "Steven Spielberg", "J.J. Abrams", "Clint Eastwood"]


Director.delete_all
directors.each do |director|
  Director.create name: director
end

{"Captain Phillips": "Paul Greengrass",
"Jurassic Park": "Steven Spielberg",
"Star Trek": "J.J. Abrams",
"Jurassic World": "Colin Trevorrow",
"Moneyball": "Bennett Miller",
"Lincoln": "Steven Spielberg",
"Sully": "Clint Eastwood",
"Raiders of the Lost Ark": "Steven Spielberg",
"Star Wars: The Force Awakens": "J.J. Abrams",
"Apollo 13": "Ron Howard",
"Cast Away": "Robert Zemeckis",
"Guardians of the Galaxy": "James Gunn"}.each do |title, name|
  movie = Movie.find_by(title: title)
  director = Director.find_by(name: name)
  if director == nil
    director = Director.create name:name
  end
  movie.update director_id: director.id
end
print "There are now #{Director.count} directors in the database.\n"
print "There are now #{Actor.count} actors in the database.\n"
