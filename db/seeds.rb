Movie.delete_all
MovieTheater.delete_all
NowPlaying.delete_all


m1 = Movie.create(name: "Avengers: Endgame", genre: "Action/Sci-fi", rating: 10)
m2 = Movie.create(name: "Avatar", genre: "Action/Sci-fi", rating: 9)
m3 = Movie.create(name: "Parasite", genre: "Thriller/Comedy", rating: 9)
m4 = Movie.create(name: "It Chapter Two", genre: "Horror/Thriller", rating: 7)
m5 = Movie.create(name: "John Wick: Chapter 3 – Parabellum", genre: "Action/Thriller", rating: 8)

t1 = MovieTheater.create(name: "AMC Lincoln Square 13", location: "New York, NY")
t2 = MovieTheater.create(name: "Cinemart Cinemas", location:"Forest Hills, NY")
t3 = MovieTheater.create(name: "Alamo Drafthouse Downtown Brooklyn", location: "Brooklyn, NY")

np1 = NowPlaying.create(movies_id: m1.id, movie_theaters_id: t1.id)
np2 = NowPlaying.create(movies_id: m2.id, movie_theaters_id: t1.id)
np3 = NowPlaying.create(movies_id: m3.id, movie_theaters_id: t2.id)
np4 = NowPlaying.create(movies_id: m4.id, movie_theaters_id: t3.id)
np5 = NowPlaying.create(movies_id: m5.id, movie_theaters_id: t3.id)









