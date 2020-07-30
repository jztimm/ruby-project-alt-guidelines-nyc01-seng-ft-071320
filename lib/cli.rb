require 'time'

class Cli

    def Cli.start
        user = User.start

        if user
            system("clear")
            puts "Welcome! Thank you for logging in! Would you like to watch one of these movies?"
            puts "If yes, enter the name of the movie you would like to watch:"
            Movie.all.each do |movies|
                puts movies.name
            end
            movie_name = STDIN.gets.chomp 
            movie = Movie.find_by(name: movie_name)

            puts "Where would you like to watch this movie?"
            puts "Enter the name of the theater you would like to attend:"
            MovieTheater.all.each do |movieTheaters|
                puts movieTheaters.name + ", " + movieTheaters.location
                puts "\n"
            end
            movie_theater_name = STDIN.gets.chomp
            movie_theater = MovieTheater.find_by(name: movie_theater_name)

            movie_rights = MovieRight.all.find_by(movies_id: movie.id, movie_theaters_id: movie_theater.id)

            if movie_rights
                user.reserve(movie_rights)
            else
                new_movie_rights = MovieRight.make_rights(movie.id, movie_theater.id)
                user.reserve(new_movie_rights)
            end

        else
            return user
        end
        # User.reserved_movies(user)
    end

end










