class MovieRight < ActiveRecord::Base
    belongs_to :movie
    belongs_to :movie_theater
    has_many :reservations
    has_many :users, through: :reservations

    def self.make_rights(movie_id, movie_theater_id)
        MovieRight.create(movies_id: movie_id, movie_theaters_id: movie_theater_id)
    end

end














