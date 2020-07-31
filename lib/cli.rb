require 'time'

class Cli

    def Cli.start
        user = User.start

        if user
            system("clear")
            puts "Welcome #{user.name.titleize}! Thank you for logging in! Here are the current movies available at local cinemas"
            Movie.all.each do |movies|
                puts "\n"
                puts movies.name
            end
            puts "\n"
            movie_name = STDIN.gets.chomp 
            movie = Movie.find_by(name: movie_name)

            puts "\n"
            puts "Reserve a ticket at one of your local cinemas"
            puts "Enter the name of the one of the available theaters you want to reserve:"
            MovieTheater.all.each do |movieTheaters|
                puts "\n"
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
            puts "\n"
            puts "Thank you for reserving #{movie_name}, at #{movie_theater_name}"
        else
            return user
        end
        # User.reserved_movies(user)
    end

end










