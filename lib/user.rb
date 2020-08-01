require 'pry'
class User < ActiveRecord::Base
    has_many :reservations
    has_many :movie_rights, through: :reservations

    def self.start

    puts"
      #####  ### #     # ####### #     #    #        #####  ### #     #     
     #     #  #  ##    # #       ##   ##   # #      #     #  #  ##    #     
     #        #  # #   # #       # # # #  #   #     #        #  # #   #     
     #        #  #  #  # #####   #  #  # #     #    #        #  #  #  #     
     #        #  #   # # #       #     # #######    #        #  #   # #     
     #     #  #  #    ## #       #     # #     #    #     #  #  #    ##    
      #####  ### #     # ####### #     # #     #     #####  ### #     # 
      
                                                        By: jzavier Timm
                                                            &   Israel Canessa
    "
    puts "\n\n\n"
    
        # puts "Welcome to Cinema Cin. Login or Sign up"
        # puts "To login, enter '1'"
        # puts "To sign up, enter '2'"
        
        prompt = TTY::Prompt.new
        answer = prompt.select("Welcome to Cinema Cin. Login or Sign up", %w(signup login quit))

        if answer == "signup"
            sleep(1)
            User.register
        elsif answer == "login"
            sleep(1)
            User.login
        elsif action == "quit"
            return
        else
            puts "Invalid answer. Please enter a valid answer"
            self.start
        end


    end

    def self.register
        
        prompt = TTY::Prompt.new
        name = prompt.ask("Please enter your full name:") 
        
        age = prompt.select("Select your age range:", %w(<12 >13 18+))
        
        password = prompt.mask("Please enter a password:")

        sleep(1)
        puts "\n"
        puts "Account successfully created! You can now login"
        sleep(3)
            
        system("clear")
        sleep(1)
            
        user = User.create(name: name, age: age, password: password)
        login
    end

    def self.login
        
        prompt = TTY::Prompt.new

        puts "Login:\n"

        name = prompt.ask("Please enter your full name:") 
        password = prompt.mask("Please enter your password:")
        
        user = User.find_by(name: name, password: password)
    end

    def what_to_do
        prompt = TTY::Prompt.new
        puts "\nWelcome #{self.name.titleize}! Thank you for logging in!"
        action = prompt.select("What would you like to do?", %w(reserve_a_movie see_reserved_movies quit))
        
        if action == "reserve_a_movie"
            system("clear")
            result = self.find_a_movie
        elsif action == "see_reserved_movies"
            self.reserved_movies
        elsif action == "quit"
            Cli.start
        end
    end

    def find_a_movie
        prompt = TTY::Prompt.new
        
        puts "Here are the current movies available at local cinemas\n"

        choices = []
        Movie.all.each do |movie|
            choices << {name: movie.name, value: movie}
        end

        movie = prompt.select("Movies", choices)

        puts "\n"
        puts "Reserve a ticket at one of your local cinemas"
        puts "Enter the name of the one of the available theaters you want to reserve:"
        choices = []
        MovieTheater.all.each do |movie_theater|
            choices << {name: "#{movie_theater.name}, #{movie_theater.location}", value: movie_theater}
        end

        movie_theater = prompt.select("Movie Theater", choices)
        

        movie_rights = MovieRight.all.find_by(movies_id: movie.id, movie_theaters_id: movie_theater.id)

        if movie_rights
            self.reserve(movie_rights)
        else
            new_movie_rights = MovieRight.make_rights(movie.id, movie_theater.id)
            self.reserve(new_movie_rights)
        end
        puts "Reserving...\n"
        sleep(2)
        puts "\n\n\n\n\n\n"
        puts "Thank you for reserving #{movie.name}, at #{movie_theater.name}"

        sleep(4)
        system("clear")

        what_to_do
    end

    def reserve(movie_rights)
        Reservation.create(users_id: self.id, movie_rights_id: movie_rights.id)
    end

    def movie_rights
        MovieRight.all.map { |movie_right| movie_right}
    end

    def reservations
        Reservation.all.map { |res| res.users_id == self}
    end

    def reserved_movies
        self.reservations.select { |res| res.movie_id}
    end
    
end
