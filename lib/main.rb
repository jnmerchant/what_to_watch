require 'csv'
require_relative 'movie'

def main
  movies = read_movie_file
  puts movies

  matching_titles = search_titles('um', movies)
  puts matching_titles

end

def read_movie_file
  file = '../data/movie_sample_data.csv'
  movies = {}
  CSV.foreach(file, {:headers => true }) do |movie|
    movie_id = movie[0]
    movie_obj = Movie.new(movie[0].to_i, movie[1], movie[2])
    movies[movie_id] = movie_obj
  end
  movies
end

def search_titles(search_input, movies)
  matching_titles = []

  movies.each do |id, movie|
    if movie.title.include? search_input
      matching_titles << movie.title
    end
  end
  matching_titles
end



main if __FILE__ == $PROGRAM_NAME
