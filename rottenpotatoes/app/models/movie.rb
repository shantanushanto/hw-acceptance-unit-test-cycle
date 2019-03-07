class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  # This function should return a list of all of a director's
  # movies given a movie name
  # If no director is found for the provided movie, an
  # empty list is returned.
  def self.find_directors_movies(movie_id)
    movie = self.find(movie_id)

    # If no director is found from a given movie, 
    # just return an empty list of movies. 
    # Otherwise, return a list of all movies
    if movie.director == nil
        return []
    else 
        # Grab all of a director's movies using 'where' on the db
        movie_list = self.where(:director => movie.director)
        return movie_list
    end
  end

end
