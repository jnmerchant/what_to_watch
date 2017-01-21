require 'movie'
require 'csv'

describe Movie do
  before do
    @movie_file = 'data/movie_sample_data.csv'
    @rating_file = 'data/rating_sample_data.csv'
    @movie = Movie.new(1, 'Toy Story', 'Comedy')
  end

  describe ' # new ' do
    context ' creates a new movie object ' do
      it 'creates a new movie object with an id, title, and genre' do
        expect(@movie.title).to eq 'Toy Story'
        expect(@movie.id).to eq 1
      end
    end
  end

  describe ' #self.read_file(movie_file)' do
    context 'when given a file' do
      it 'returns a hash of movie objects' do
        movies = Movie.read_file(@movie_file)
        expect(movies['1'].title).to eq "Toy Story (1995)"
      end
    end
  end

  describe '#get_ratings' do
    context 'when passed a hash of rating objects' do
      it 'returns an array of all ratings for movie' do
        all_ratings = Rating.read_file(@rating_file)
        expect(@movie.get_ratings(all_ratings)).to eq [2.5, 5.0, 1.0]
      end
    end
  end

  describe '#get_average_rating' do
    context 'when passed an array of ratings' do
      it 'returns the average rating for movie' do
        all_ratings = Rating.read_file(@rating_file)
        expect(@movie.get_average_rating(all_ratings)).to eq 2.8
      end
    end
  end

end
