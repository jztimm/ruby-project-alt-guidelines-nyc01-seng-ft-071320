require 'time'

class Cli

    def Cli.start
        system("clear")
        user = User.start
        if user
            user.what_to_do
        else
            puts "Die"
            sleep(2)
            Cli.start
        end
    end

end










