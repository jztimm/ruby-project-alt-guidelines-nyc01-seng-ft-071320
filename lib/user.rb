class User < ActiveRecord::Base
    has_many :reservations
    has_many :movie_rights, through: :reservations

    def self.start

puts"      #####  ### #     # ####### #     #    #        #####  ### #     #    " 
puts"     #     #  #  ##    # #       ##   ##   # #      #     #  #  ##    #    " 
puts"     #        #  # #   # #       # # # #  #   #     #        #  # #   #    " 
puts"     #        #  #  #  # #####   #  #  # #     #    #        #  #  #  #    " 
puts"     #        #  #   # # #       #     # #######    #        #  #   # #    " 
puts"     #     #  #  #    ## #       #     # #     #    #     #  #  #    ##    " 
puts"      #####  ### #     # ####### #     # #     #     #####  ### #     #    " 
    
    puts "\n"
    puts "\n"
    puts "\n"



        puts "Welcome to Movie App. Would you like to login or sign up?"
        puts "To log in, enter '1'"
        puts "To sign up, enter '2'"
        answer = STDIN.gets.chomp

        if answer == "2"
            # system("clear")
            sleep(1)
            User.register
        elsif answer == "1"
            # system("clear")
            sleep(1)
            User.login
        else
            puts "Invalid answer. Please enter a valid answer"
            self.start
        end
    end

    def self.register
        puts "\n"
        puts "Please sign up. \n"
        puts "What is your name? "
        name = STDIN.gets.chomp
        puts "\n"
        puts "What's your age? "
        age = STDIN.gets.chomp
        puts "\n"
        puts "Create a password: "
        password = STDIN.gets.chomp
            
        system("clear")
        sleep(1)
            
        user = User.create(name: name, age: age, password: password)
        # User.confirm_info(user)

        Cli.start
    end

    def self.login
        puts "\n"
        puts "Please enter your name:"
        user_name = STDIN.gets.chomp
        puts "Please enter your password:"
        user_pass = STDIN.gets.chomp
        
        user = User.find_by(name: user_name, password: user_pass)
    end

    def reserve(movie_rights)
        Reservation.create(users_id: self.id, movie_rights_id: movie_rights.id)
    end

    def movie_rights
        MovieRight.all.map { |movie_right| movie_right}
    end

    
end

# def make_rights(movie_id, movie_theater_id)
#     MakeRight.create(movie_id: movie_id, movie_theater_id: movie_theater_id)
# end

# def  self.reserved_movies(user)
#     user.movie_rights.map{|rights| rights.movie}.uniq
# end

# def confirm_info(user)
#         system("clear")
#         puts "\n"
#         puts "Here is your profile:"
#         puts "\n"
#         puts "Your name is: #{name}"
#         puts "Your age is: #{age}"
#         puts "Your password is: #{password}"
#         puts "\n"
#         # is_right

#         sleep(1)
#         system("clear")
#         Cli.start
#     end


















