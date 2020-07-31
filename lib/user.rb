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
        answer = prompt.select("Welcome to Cinema Cin. Login or Sign up", %w(signup login))
        # answer = STDIN.gets.chomp

        if answer == "signup"
            # system("clear")
            sleep(1)
            User.register
        elsif answer == "login"
            # system("clear")
            sleep(1)
            User.login
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

        # puts "\n"
        # puts "Please sign up. \n"
        # puts "Enter your your full name"
        # name = STDIN.gets.chomp
        # puts "\n"
        # puts "Enter your age"
        # age = STDIN.gets.chomp
        # puts "\n"
        # puts "Create a password: "
        # password = STDIN.gets.chomp
        sleep(1)
        puts "\n"
        puts "Account successfully created! You can now login"
        sleep(3)
            
        system("clear")
        sleep(1)
            
        user = User.create(name: name, age: age, password: password)
        # User.confirm_info(user)

        login
    end

    def self.login
        
        prompt = TTY::Prompt.new

        puts "Login:\n"

        name = prompt.ask("Please enter your full name:") 
                
        password = prompt.mask("Please enter your password:")
        
        # puts "\n"
        # puts "Please enter your name:"
        # user_name = STDIN.gets.chomp
        # puts "Please enter your password:"
        # user_pass = STDIN.gets.chomp
        
        user = User.find_by(name: name, password: password)

        # if user != nil
        #     next
        # else
        #     puts "Sorry, invalid name or password"
        #     sleep(1)
        #     Cli.start
        # end

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


















