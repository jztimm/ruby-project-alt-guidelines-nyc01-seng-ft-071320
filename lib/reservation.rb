class Reservation < ActiveRecord::Base
    belongs_to :movie
    belongs_to :movie_theater
    
end



