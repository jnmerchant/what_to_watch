class Movie
attr_accessor :id, :title, :genre

# 1,Toy Story (1995),Adventure|Animation|Children|Comedy|Fantasy
# 2,Jumanji (1995),Adventure|Children|Fantasy
# 3,Grumpier Old Men (1995),Comedy|Romance
# 4,Waiting to Exhale (1995),Comedy|Drama|Romance
# 5,Father of the Bride Part II (1995),Comedy

  def initialize(id, title, genre)
    @id = id
    @title = title
    @genre = genre
  end

  def to_s
    "id: #{@id}, title:#{@title}, genre:#{@genre}"
  end
end
