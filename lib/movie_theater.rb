class MovieTheater < ActiveRecord::Base
    has_many :now_playing
    has_many :movies, through: :now_playing 

    def self.all_locations
        self.all.map{|mt|mt.location}
    end
    def self.greetings(location)
        self.all_locations.find do |location|
            location == "New York, NY"
                "Hello! Welcome to our Manhattan location"
            location == "Forest Hills, NY"
                "Hello! Welcome to our Queens location"
            location == "Brooklyn, NY"
                "Hello! Welcome to our Brooklyn location"
            # if location
            #     "We apologize, We don't have any theaters in your area"
            # end

        end    
        # if all_locations == "New York, NY"
        #     "Hello! Welcome to our Manhattan location"
        # elsif all_locations == "Forest Hills, NY"
        #     "Hello! Welcome to our Queens location"
        # else all_locations == "Brooklyn, NY"
        #     "Hello! Welcome to our Brooklyn location"
        # end
    end 

end


