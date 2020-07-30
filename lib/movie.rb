class Movie < ActiveRecord::Base
    has_many :movie_rights
    has_many :reservations, through: :movie_rights
    has_many :movie_theaters, through: :movie_rights

    def self.top_rated
        Movie.all.max_by{|movies| movies.rating}
    end
    
end





