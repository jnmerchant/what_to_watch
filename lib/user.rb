class User
  attr_reader :user_id
  attr_reader :reviews

  def initialize(user_id, review)
    @user_id = user_id
    @reviews = review
  end

  def self.read_file(rating_file)
    users = {}

    CSV.foreach(rating_file, {:headers => true}) do |rating|
      user_key = rating[0].to_i
      movie_key = rating[1].to_i
      rating_value = rating[2].to_f
      if users.include? user_key
        update_reviews(users[user_key], movie_key, rating_value)
      else
        user_obj = User.new(user_key, {movie_key => rating_value})
        users[user_key] = user_obj
      end
    end
    users
  end

  def self.get_reviews(search_input, users)
    matching_reviews = {}
    # puts users
    users.each do |id, user|
      if user.user_id == search_input
        matching_reviews = user.reviews
      end
    end
    matching_reviews
  end

  def self.display_matching_reviews(matching_reviews, movies)
    format = "%-60s\t%#5s\n"
    printf(format, "Title", "Rating")
    printf(format, "-----", "------")
    matching_reviews.each do |movie_id, review|
      trimmed_title = movies[movie_id].title.length > 60 ?
        trimmed_title = movies[movie_id].title[0,60]
        : movies[movie_id].title

      printf(format, trimmed_title, "#{review}")
    end
  end

  def self.update_reviews(user_obj, movie_key, rating_value)
    user_obj.reviews.merge!(movie_key => rating_value)
  end

end
