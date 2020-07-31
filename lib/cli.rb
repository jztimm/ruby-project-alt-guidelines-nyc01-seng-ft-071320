require 'time'

class Cli

    def Cli.start
        system("clear")
        user = User.start
        
        if user
            user.what_to_do
        end
    end

end










