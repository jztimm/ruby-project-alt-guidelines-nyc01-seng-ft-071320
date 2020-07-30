class movieRight < ActiveRecord::Base
    belongs_to :movie
    belongs_to :movie_theater
    has_many :reservations
    has_many :users through :reservations

end














