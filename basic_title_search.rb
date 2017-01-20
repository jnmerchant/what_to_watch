require 'csv'

def get_movie_titles(csv_file)
  titles = []

  CSV.foreach(csv_file, {:headers => true}) do |row|
    titles << row[1]
  end

  titles
end

def get_user_search
  input = ''

  while input == ''
    puts "Please enter a movie title."
    input = gets.chomp
  end

  input
end

def search_titles(input, titles)
  results = []

  titles.each do |title|
    if title.downcase.include? input.downcase
      results << title
    end
  end

  results
end

def main
  csv_file = '/Users/Brentice/TIY/week_2/what_to_watch/movie_lens/movies.csv'

  titles = get_movie_titles(csv_file)

  input = get_user_search

  results = search_titles(input, titles)

  puts results
end

main if __FILE__ == $PROGRAM_NAME
