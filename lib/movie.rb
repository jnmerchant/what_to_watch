class Movie
  attr_reader :id, :title, :genre

  def initialize(id, title, genre)
    @id = id
    @title = title
    @genre = genre
    @average_rating = 0
  end

  def get_movie_rating(ratings)
    matching_ratings = []

    ratings.each do |rating_id, rating|
      if rating.movie_id == @id
        matching_ratings << rating.score
      end
    end

    @average_rating = calculate_average_rating(matching_ratings)
  end

  def calculate_average_rating(matching_ratings)
    (matching_ratings.reduce(0, :+) / matching_ratings.count).round(1)
  end

  def to_s
    "ID: #{@id} Title: #{@title} Genre: #{@genre} Average Rating: #{@average_rating}"
  end
end
