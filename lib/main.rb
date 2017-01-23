require 'csv'
require_relative 'movie'
require_relative 'rating'
require_relative 'user'

def main
  movie_file = '../data/movies.csv' #full file
  rating_file = '../data/ratings.csv' #full file

  movies = Movie.read_file(movie_file)
  ratings = Rating.read_file(rating_file, movies)
  users = User.read_file(rating_file)

  loop do
    menu_selection = menu_prompt

    if menu_selection == 1
      search_movie_option(movies)
    else menu_selection == 2
      search_user_option(users, movies)
    end

    search_input = gets.chomp
    if search_input == 'EXIT'
      break
    end
  end
end

def search_movie_option(movies)
  loop do
    search_movie_prompt
    search_input = gets.chomp
    if search_input == 'EXIT'
      break
    end
    matching_titles = Movie.search_titles(search_input, movies)
    Movie.display_matching_titles(matching_titles)
  end
end

def search_user_option(users, movies)
  loop do
    search_user_prompt
    search_input = gets.chomp
    if search_input == 'EXIT'
      break
    end
    matching_reviews = User.get_reviews(search_input.to_i, users)
    User.display_matching_reviews(matching_reviews, movies)
  end
end

def menu_prompt
  puts "Enter 1 to search movies or 2 to search users:"
  gets.chomp.to_i
end

def search_movie_prompt
  puts "Enter movie title to search (enter 'EXIT' to end search): "
end

def search_user_prompt
  puts "Enter user id for reviews (enter 'EXIT' to end search): "
end

main if __FILE__ == $PROGRAM_NAME
