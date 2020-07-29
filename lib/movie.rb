class Movie < ActiveRecord::Base
    has_many :reservations
    has_many :movie_theaters, through: :now_playings 

    def self.top_rated
        Movie.all.max_by{|movies| movies.rating}
    end
    
end





