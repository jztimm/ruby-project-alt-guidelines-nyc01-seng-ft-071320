class MovieRight < ActiveRecord::Base
    belongs_to :movie
    belongs_to :movie_theater
    has_many :reservations
    has_many :users, through: :reservations

    def make_rights
        self.create(movies_id: movie.id, movie_theaters_id: movie_theater.id)
    end

end














