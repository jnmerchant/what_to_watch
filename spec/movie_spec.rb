require 'movie'

describe Movie do
  describe ' # new ' do
    context ' #creates a new movie object' do
      it 'creates a new movie object with an id, title, and genre' do
      movie = Movie.new(1, 'Toy Story', 'Comedy')
      expect(movie.title).to eq 'Toy Story'
      expect(movie.id).to eq 1
      end
    end
  end
end
