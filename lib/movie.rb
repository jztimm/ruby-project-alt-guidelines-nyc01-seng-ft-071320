class Movie < ActiveRecord::Base
    has_many :now_playing
    has_many :movie_theaters, through: :now_playing 

    def self.top_rated
        Movie.all.max_by{|movies| movies.rating}
    end
    
end





