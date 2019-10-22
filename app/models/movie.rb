class Movie < ActiveRecord::Base
  def self.all_ratings
    %w(G PG PG-13 NC-17 R)
  end
  
  # def same_director
  #   Movie.where(director: director).where.not(id: id).take
  # end
  
  def movies_with_same_director
    result = []
    Movie.where(director: self.director).find_each do |movie|
      if movie != self
        result += [movie.title]
      end
    end
    return result
  end
  
end
