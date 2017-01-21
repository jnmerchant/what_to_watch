class Movie
attr_reader :id, :title, :genre

# 1,Toy Story (1995),Adventure|Animation|Children|Comedy|Fantasy
# 2,Jumanji (1995),Adventure|Children|Fantasy
# 3,Grumpier Old Men (1995),Comedy|Romance
# 4,Waiting to Exhale (1995),Comedy|Drama|Romance
# 5,Father of the Bride Part II (1995),Comedy

  def initialize(id, title, genre)
    @id = id
    @title = title
    @genre = genre
    @average_rating = nil
  end

  def get_movie_rating(ratings)
    matching_ratings = []

    ratings.each do |rating_id, rating|
      if rating.movie_id == @id
        matching_ratings << rating.score
      end
    end
    
    calculate_average_rating(matching_ratings)
  end

  def calculate_average_rating(matching_ratings)
    (matching_ratings.reduce(0, :+) / matching_ratings.count).round(1)
  end

  def to_s
    "id: #{@id}, title:#{@title}, genre:#{@genre}"
  end
end
