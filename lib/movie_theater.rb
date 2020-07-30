class MovieTheater < ActiveRecord::Base
    # has_many :movies
    # has_many :users, through :reservations, :movies 

    def self.all_locations
        self.all.map{|mt|mt.location}
    end 

end


