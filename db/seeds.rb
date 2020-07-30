User.delete_all
Movie.delete_all
MovieTheater.delete_all
MovieRight.delete_all
Reservation.delete_all

u1 = User.create(name: "jzavier", age: 21, password: "1234")
u2 = User.create(name: "israel", age: 23, password: "2222")
u3 = User.create(name: "joanna", age: 22, password: "3333")
u4 = User.create(name: "ethan", age: 15, password: "4444")
u5 = User.create(name: "kev", age: 18, password: "5555")

m1 = Movie.create(name: "Avengers: Endgame", genre: "Action/Sci-fi", rating: 10)
m2 = Movie.create(name: "Avatar", genre: "Action/Sci-fi", rating: 9)
m3 = Movie.create(name: "Parasite", genre: "Thriller/Comedy", rating: 9)
m4 = Movie.create(name: "It Chapter Two", genre: "Horror/Thriller", rating: 7)
m5 = Movie.create(name: "John Wick: Chapter 3 – Parabellum", genre: "Action/Thriller", rating: 8)

t1 = MovieTheater.create(name: "AMC Lincoln Square 13", location: "New York, NY")
t2 = MovieTheater.create(name: "Cinemart Cinemas", location:"Forest Hills, NY")
t3 = MovieTheater.create(name: "Alamo Drafthouse Downtown Brooklyn", location: "Brooklyn, NY")

mv1 = MovieRight.create(movies_id: m1.id, movie_theaters_id: t1.id)
mv2 = MovieRight.create(movies_id: m2.id, movie_theaters_id: t1.id)
mv3 = MovieRight.create(movies_id: m3.id, movie_theaters_id: t2.id)
mv4 = MovieRight.create(movies_id: m5.id, movie_theaters_id: t3.id)
mv5 = MovieRight.create(movies_id: m3.id, movie_theaters_id: t2.id)
mv6 = MovieRight.create(movies_id: m4.id, movie_theaters_id: t1.id)

res1 = Reservation.create(users_id: u1.id, movie_rights_id: mv5.id)
res2 = Reservation.create(users_id: u3.id, movie_rights_id: mv2.id)
res3 = Reservation.create(users_id: u5.id, movie_rights_id: mv5.id)
res4 = Reservation.create(users_id: u2.id, movie_rights_id: mv6.id)
res5 = Reservation.create(users_id: u2.id, movie_rights_id: mv4.id)
res6 = Reservation.create(users_id: u3.id, movie_rights_id: mv6.id)
res7 = Reservation.create(users_id: u1.id, movie_rights_id: mv4.id)
res8 = Reservation.create(users_id: u1.id, movie_rights_id: mv3.id)
res9 = Reservation.create(users_id: u2.id, movie_rights_id: mv3.id)
res10 = Reservation.create(users_id: u4.id, movie_rights_id: mv2.id)
res11 = Reservation.create(users_id: u4.id, movie_rights_id: mv1.id)


# np1 = Reservation.create(movies_id: m1.id, movie_theaters_id: t1.id)
# np2 = Reservation.create(movies_id: m2.id, movie_theaters_id: t1.id)
# np3 = Reservation.create(movies_id: m3.id, movie_theaters_id: t2.id)
# np4 = Reservation.create(movies_id: m4.id, movie_theaters_id: t3.id)
# np5 = Reservation.create(movies_id: m5.id, movie_theaters_id: t3.id)









