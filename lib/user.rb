class User < ActiveRecord::Base

    # has_many :reservations
    # has_many :movie_rights, through :reservations

    def reserved_movies
        User.movie_rights.map{|rights| rights.movie}.uniq
    end

end





















