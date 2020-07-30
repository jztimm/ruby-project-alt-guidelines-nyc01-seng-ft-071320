class MovieTheater < ActiveRecord::Base
    has_many :movie_rights
    has_many :reservations, through :movie_rights
    has_many :movies through :movie_rights

    def self.all_locations
        self.all.map{|mt|mt.location}
    end 

end


