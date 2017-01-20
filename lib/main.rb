require 'csv'
require_relative 'movie'

def main
  read_movie_file
end

def read_movie_file
  file = '../data/movie_sample_data.csv'
  movies = {}
  CSV.foreach(file, {:headers => true }) do |movie|
    movie_id = movie[0]
    movie_obj = Movie.new(movie[0], movie[1], movie[2])
    movies[movie_id] = movie_obj
  end
  puts movies
end



main if __FILE__ == $PROGRAM_NAME
