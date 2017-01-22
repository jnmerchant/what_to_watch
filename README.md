# What To Watch
## Synopsis
This ruby program was designed to take in several CSV files containing data on movies, ratings, genres, users, etc. and return search results based on user input.



## Code Example
```ruby   
def self.read_file(movie_file)
  movies = {}

  CSV.foreach(movie_file, {:headers => true }) do |movie|
    movie_id = movie[0]
    movie_obj = Movie.new(movie[0].to_i, movie[1], movie[2])
    movies[movie_id] = movie_obj
  end
  movies
end
  ```


## Motivation
Purposes for developing this program include:
  * Practicing using the CSV class to read files
  * Filtering and transforming data and performing calculations
  * Modeling a problem using objects nd functions
  * Using git on a team



## Tests
Automated unit tests written using RSpec version 3.5.4

For info:
https://github.com/rspec/rspec

```ruby
describe '#get_average_rating' do
  context 'when passed an array of ratings' do
    it 'returns the average rating for movie' do
      all_ratings = Rating.read_file(@rating_file)
      expect(@movie.get_average_rating(all_ratings)).to eq 2.8
    end
  end
end
```


## Contributors
> F. Maxwell Harper and Joseph A. Konstan. 2015. The MovieLens Datasets: History and Context. ACM Transactions on Interactive Intelligent Systems (TiiS) 5, 4, Article 19 (December 2015), 19 pages. DOI=<http://dx.doi.org/10.1145/2827872>

## Authors
* Joe Merchant
* Jenn Tustin
